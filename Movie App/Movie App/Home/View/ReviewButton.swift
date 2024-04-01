//
//  ReviewButton.swift
//  Movie App
//
//  Created by Bilal Ahmad on 29/03/2024.
//

import UIKit

class ReviewButton: UIButton {
    
    /// container view
    private let containerView: UIView = {
       let view = UIView()
        view.setDimensions(height: 40, width: 40)
        view.layer.cornerRadius = 40 / 2
        view.backgroundColor = Colors.grey
        return view
    }()
    
    /// image view
    private let buttonIcon: UIImageView = {
        let iv = UIImageView()
        iv.setDimensions(height: 20, width: 20)
        return iv
    }()
    
    /// title
    private let buttonTitleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = Colors.text.secondary
        label.font = UIFont.Font(family: .regular, size: .small)
        return label
    }()
    
    init(title: String, image: UIImage) {
        super.init(frame: .zero)
        buttonIcon.image = image
        buttonTitleLabel.text = title
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        
        /// container view
        addSubview(containerView)
        containerView.anchor(top: topAnchor,left: leftAnchor, right: rightAnchor)
        
        /// image view
        containerView.addSubview(buttonIcon)
        buttonIcon.center(inView: containerView)
        
        /// button title label
        addSubview(buttonTitleLabel)
        buttonTitleLabel.centerX(inView: containerView, topAnchor: containerView.bottomAnchor, paddingTop: 5)
        buttonTitleLabel.anchor(bottom: bottomAnchor)
        
    }

}
