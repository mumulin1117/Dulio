//
//  UIImageView + Load.swift
//  DJWaveCow
//
//  Created by  on 2025/6/6.
//

import UIKit

extension Float {
    func clamped(to range: ClosedRange<Float>) -> Float {
        min(max(self, range.lowerBound), range.upperBound)
    }
}



class BeatImageLoader {
    private static let imageCache = NSCache<NSString, UIImage>()
    
    static func loadImage(from urlString: String?, into imageView: UIImageView) {
        // 重置ImageView状态
        imageView.image = nil
        
        guard let urlString = urlString,
              let url = URL(string: urlString) else {
            return
        }
        
        // 检查缓存
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            imageView.image = cachedImage
            return
        }
        
        // 异步加载图片
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                
                // 缓存图片
                imageCache.setObject(image, forKey: urlString as NSString)
                
                // 主线程更新UI
                DispatchQueue.main.async {
                    UIView.transition(with: imageView,
                                    duration: 0.3,
                                    options: .transitionCrossDissolve) {
                        imageView.image = image
                    }
                }
            }
        }
    }
}
