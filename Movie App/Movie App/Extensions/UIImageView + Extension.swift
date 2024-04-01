//
//  UIImageView + Extension.swift
//  Movie App
//
//  Created by Bilal Ahmad on 31/03/2024.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(from url: URL) {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Error downloading image: \(error)")
                return
            }

            guard let data = data, let image = UIImage(data: data) else {
                print("Invalid image data")
                return
            }

            DispatchQueue.main.async {
                self?.image = image
            }
        }
        task.resume()
    }
}
