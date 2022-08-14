//
//  DownloadImage.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/14.
//

import SwiftUI

extension View {
    
    func downloadImageAsync(url: URL, completion: @escaping (UIImage?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, _, _) in
            var image: UIImage?
            if let imageData = data {
                image = UIImage(data: imageData)
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }
        task.resume()
    }
}
