//
//  UIFont + Extension.swift
//  Job Search
//
//  Created by Bilal Ahmad on 26/03/2024.
//

import UIKit

enum FontFamily {
    case regular
    case medium
    case heavy
    
    var name: String {
        switch self {
        case .regular:
            return "Avenir"
        case .medium:
            return "Avenir-Medium"
        case .heavy:
            return "Avenir-Heavy"
        }
    }
}

enum FontSize {
    case small
    case medium
    case large
    
    var size: CGFloat {
        switch self{
        case .small:
            return 12
        case .medium:
            return 14
        case .large:
            return 22
        }
    }
}

extension UIFont {
    static func Font(family: FontFamily, size: FontSize) -> UIFont {
        guard let font = UIFont(name: family.name, size: size.size) else {
            fatalError("Font '\(family.name)' not found")
        }
        return font
    }
}
