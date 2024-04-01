//
//  Images.swift
//  Movie App
//
//  Created by Bilal Ahmad on 31/03/2024.
//

import Foundation
import UIKit

struct Image{
    static let chevronRight = UIImage(named: "chevron_right")!.withRenderingMode(.alwaysOriginal)
    static let defaultBannerImage = UIImage(named: "default_banner_image")?.withRenderingMode(.alwaysOriginal)
    
    static let chevronLeft = UIImage(named: "left_arrow")!.withRenderingMode(.alwaysOriginal)
    static let searchIcon = UIImage(named: "search_icon")!.withRenderingMode(.alwaysOriginal)
    static let bottomOverlay = UIImage(named: "bottom_overlay")!.withRenderingMode(.alwaysOriginal)
    
    struct reviewImage{
        static let watchListIcon = UIImage(named: "plus_icon")!.withRenderingMode(.alwaysOriginal)
        static let likeIcon = UIImage(named: "like_icon")!.withRenderingMode(.alwaysOriginal)
        static let dislikeIcon = UIImage(named: "dislike_icon")!.withRenderingMode(.alwaysOriginal)
    }
}
