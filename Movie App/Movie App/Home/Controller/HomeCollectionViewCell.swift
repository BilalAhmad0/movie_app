//
//  HomeCollectionViewCell.swift
//  Movie App
//
//  Created by Bilal Ahmad on 29/03/2024.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    // MARK:- Reuse Identifier
    static let reuseIdentifier = String(describing: HomeCollectionViewCell.self)
    
    // MARK: - initializers
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
