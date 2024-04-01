//
//  HomeHeaderView.swift
//  Movie App
//
//  Created by Bilal Ahmad on 29/03/2024.
//

import UIKit

protocol HomeHeaderViewDelegate: AnyObject{
    func didTappedOnPlay()
}

class HomeHeaderView: UIView {
    
    var delegate: HomeHeaderViewDelegate?
    
    /// title label
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Font(family: .heavy, size: .large)
        label.text = "Billions"
        label.textColor = Colors.text.primary
        
        return label
    }()
    
    ///  year label
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.text = "2017 |"
        label.font = UIFont.Font(family: .medium, size: .small)
        label.textColor = Colors.text.secondary

        return label
    }()
    
    ///  season  label
    private let seasonLabel: UILabel = {
        let label = UILabel()
        label.text = "3 Seasons |"
        label.font = UIFont.Font(family: .medium, size: .small)
        label.textColor = Colors.text.secondary

        return label
    }()
    
    ///  season  label
    private let rLabel: UILabel = {
        let label = UILabel()
        label.text = "R"
        label.font = UIFont.Font(family: .medium, size: .small)
        label.textColor = Colors.text.secondary

        return label
    }()
    
    /// play button
    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.backgroundColor = Colors.Button.play
        button.setTitleColor(Colors.text.primary, for: .normal)
        button.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        return button
    }()
    
    /// trailer button
    private lazy var tailerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Trailer", for: .normal)
        button.backgroundColor = Colors.Button.trailer
        button.setTitleColor(Colors.text.primary, for: .normal)
        return button
    }()
    
    /// header description
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "A complex, inticate narrative that takes a forensic look at New York City's world of high finance. As two highly ambitious figures colide."
        label.font = UIFont.Font(family: .medium, size: .medium)
        label.textColor = Colors.text.secondary

        label.numberOfLines = 0
        return label
    }()
    
    /// watch list button
    private lazy var watchListButton: ReviewButton = {
        let button = ReviewButton(title: "Watchlist", image: Image.reviewImage.watchListIcon)
        return button
    }()
    
    /// like button
    private lazy var likeButton: ReviewButton = {
        let button = ReviewButton(title: "I like it", image: Image.reviewImage.likeIcon)
        return button
    }()
    
    /// dislike button
    private lazy var dislikeButton: ReviewButton = {
        let button = ReviewButton(title: "I don't like it", image: Image.reviewImage.dislikeIcon)
        return button
    }()
    
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // setup view and layout constraints
    private func setupViews() {
        backgroundColor = Colors.appBackgroundColor
        
        /// main heading
        let mediaInfoStack = UIStackView.createStackView(axis: .horizontal, alignment: .leading, distribution: .fillProportionally, spacing: 2)
        mediaInfoStack.addArrangedSubviews([yearLabel, seasonLabel, rLabel])
        
        let mainHeadingStack = UIStackView.createStackView(axis: .vertical, alignment: .fill, distribution: .fillProportionally, spacing: 2)
        mainHeadingStack.addArrangedSubviews([titleLabel, mediaInfoStack])
        
        addSubview(mainHeadingStack)
        mainHeadingStack.anchor(top: topAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 20)
        
        /// heading buttons
        let buttonStack = UIStackView.createStackView(axis: .horizontal, alignment: .leading, distribution: .fillEqually, spacing: 10)
        buttonStack.addArrangedSubviews([playButton, tailerButton])
        
        addSubview(buttonStack)
        buttonStack.anchor(top: mainHeadingStack.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 20,paddingRight: 20)
        
        /// header description
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: buttonStack.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 20,paddingRight: 20)
        
        let reviewButtonStack = UIStackView.createStackView(axis: .horizontal, alignment: .leading, distribution: .fillEqually, spacing: 20)
        reviewButtonStack.addArrangedSubviews([watchListButton, likeButton, dislikeButton])
        
        addSubview(reviewButtonStack)
        reviewButtonStack.anchor(top: descriptionLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 10, paddingLeft: 20)
        
    }
    
    @objc func playButtonTapped(){
        self.delegate?.didTappedOnPlay()
    }
    
}
