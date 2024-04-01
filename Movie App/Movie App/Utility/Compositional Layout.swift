//
//  Compositional Layout.swift
//  Movie App
//
//  Created by Bilal Ahmad on 29/03/2024.
//

import UIKit



struct CompositionalLayout
{
    enum CompositionalGroupAlignment
    {
        case vertical
        case horizontal
    }
    
    static func createItem(width: NSCollectionLayoutDimension,
                           height: NSCollectionLayoutDimension,
                           top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0) -> NSCollectionLayoutItem
    {
        // Define Item Size
        let itemSize = NSCollectionLayoutSize(widthDimension: width, heightDimension: height)
        
        // Create Item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
        return item
    }
    
    static func createGroup(alignment: CompositionalGroupAlignment,
                            width: NSCollectionLayoutDimension,
                            height: NSCollectionLayoutDimension,
                            items: [NSCollectionLayoutItem]
    ) -> NSCollectionLayoutGroup
    {
        // Define Group Size
        let groupSize = NSCollectionLayoutSize(widthDimension: width, heightDimension: height)

        switch alignment
        {
            // Create Group
        case .vertical: return NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: items)
        case .horizontal: return NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: items)
        }
    }
    
    static func createGroup(alignment: CompositionalGroupAlignment,
                            width: NSCollectionLayoutDimension,
                            height: NSCollectionLayoutDimension,
                            item: NSCollectionLayoutItem,
                            count: Int
    ) -> NSCollectionLayoutGroup
    {
        // Define Group Size
        let groupSize = NSCollectionLayoutSize(widthDimension: width, heightDimension: height)
        
        switch alignment
        {
            // Create Group
        case .vertical: return NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: count)
        case .horizontal: return NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: count)
        }
    }
}

