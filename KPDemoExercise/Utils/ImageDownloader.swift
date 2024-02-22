//
//  ImageDownloader.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 14.2.24..
//

import Foundation
import UIKit

struct ImageDownloader {
    static func downloadImageTo(imageView: UIImageView?, resource: String) {
        guard let imageView = imageView else {
            return
        }
        let url = URL(string: "\(KeyStrings.baseUrl)\(resource)")
        if let url = url {
            ImageDownloader.loadImage(from: url) { (image) in
                DispatchQueue.main.async {
                    if let image = image {
                        imageView.image = image
                    }
                }
            }
        }
    }
    
    static func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, !data.isEmpty, error == nil else {
                completion(nil)
                return
            }
            
            if let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
