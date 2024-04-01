//
//  HomeCollectionViewCell.swift
//  Movie App
//
//  Created by Bilal Ahmad on 30/03/2024.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: HomeCollectionViewCell.self)
    
    /// chevron right
    private let chevronRightImage: UIImageView = {
       let iv = UIImageView()
        iv.setWidth(20)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    /// media image
    private let mediaImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = Image.defaultBannerImage
        iv.setDimensions(height: 50, width: 80)
        return iv
    }()
    
    /// movie title
    private let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.Font(family: .medium, size: .medium)
        label.textColor = Colors.white
        return label
    }()
    
    // MARK: - View Initializer
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        // UI Setup
        layoutViewsWithConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Method
    private func layoutViewsWithConstraints(){
        backgroundColor = Colors.cellBackgound

        /// chevron right image view
        addSubview(chevronRightImage)
        chevronRightImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingLeft: 5)
        
        /// media image
        addSubview(mediaImageView)
        mediaImageView.centerY(inView: self, leftAnchor: chevronRightImage.rightAnchor, paddingLeft: 5)
        
        /// movie title
        addSubview(movieTitleLabel)
        movieTitleLabel.centerY(inView: self, leftAnchor: mediaImageView.rightAnchor, paddingLeft: 20)
        movieTitleLabel.anchor(right: rightAnchor, paddingRight: 20)
    }
    
    func configureCell(){
        movieTitleLabel.text = "E1 - Tie Goes To The Runner"
        mediaImageView.image = Image.defaultBannerImage
        chevronRightImage.image = Image.chevronRight

    }
    
}
