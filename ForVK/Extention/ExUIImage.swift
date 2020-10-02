//
//  ExUIImage.swift
//  ForVK
//
//  Created by Илья Кадыров on 30.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//
import UIKit

extension UIImage {
    /// Loads an image from the specified URL on a background thread
    static func load(from urlStr: String?, completion: @escaping (UIImage) -> Void) {
        DispatchQueue.global().async {
            do {
                if urlStr == nil {
                    completion(UIImage(systemName: "photo")!)
                }
                let url = URL(string: urlStr!)
                let data = try Data(contentsOf: url!)
                guard let image = UIImage(data: data) else {
                    debugPrint("faled get Image")
                    return
                }

                DispatchQueue.main.async {
                    completion(image)
                }
            } catch {
                debugPrint("faled get Image from Url")
            }
        }
    }
}
