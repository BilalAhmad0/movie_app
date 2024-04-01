//
//  SeasonCollectionViewCell.swift
//  Movie App
//
//  Created by Bilal Ahmad on 30/03/2024.
//

import UIKit

class SeasonCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: SeasonCollectionViewCell.self)
    
    override var isSelected: Bool{
      didSet{
        if self.isSelected
        {
            bottomBar.backgroundColor = Colors.white
            titleLabel.textColor = Colors.white
        }
        else
        {
            bottomBar.backgroundColor = Colors.clear
            titleLabel.textColor = Colors.grey
        }
      }
    }

    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                bottomBar.backgroundColor = Colors.white
                titleLabel.textColor = Colors.white
            } else {
                bottomBar.backgroundColor = Colors.clear
                titleLabel.textColor = Colors.grey
            }
        }
    }
    /// title
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Season"
        label.font = UIFont.Font(family: .medium, size: .medium)
        label.textColor = self.isSelected ? Colors.white : Colors.grey
        return label
    }()
    
    /// side bar
    private let sideBar: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = Colors.grey
        iv.setDimensions(height: 20, width: 2)
        return iv
    }()
    
    /// bottom bar
    private lazy var bottomBar: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = self.isSelected ? Colors.white : Colors.clear
        iv.setHeight(4)
        return iv
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
        backgroundColor = Colors.appBackgroundColor
        
        /// title
        addSubview(titleLabel)
        titleLabel.center(inView: self)
        
        /// side bar
        addSubview(sideBar)
        sideBar.centerYwithRightAnchor(inView: self, rightAnchor: rightAnchor, paddingRight: 0)
        
        /// bottom bar
        addSubview(bottomBar)
        bottomBar.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingRight: 3)
    }
    
    // cell configration
    func configureCell(_ season: Seasons){
        titleLabel.text = season.name
    }
    
}
