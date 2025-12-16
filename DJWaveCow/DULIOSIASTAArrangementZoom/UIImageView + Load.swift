//
//  UIImageView + Load.swift
//  DJWaveCow
//
//  Created by  on 2025/6/6.
//

import UIKit

extension Float {
    func DULIOSIASTAclamped(to range: ClosedRange<Float>) -> Float {
        min(max(self, range.lowerBound), range.upperBound)
    }
}



class DULIOSIASTABeatImageLoader {
    private static let DULIOSIASTAimageCache = NSCache<NSString, UIImage>()
    
    static func DULIOSIASTAloadDULIOSIASTAImage(DULIOSIASTAfrom urlString: String?, DULIOSIASTAinto imageView: UIImageView) {
      
        imageView.image = nil
        
        guard let urlDULIOSIASTAString = urlString,
              let DULIOSIASTAurl = URL(string: urlDULIOSIASTAString) else {
            return
        }
       
        if let cachedDULIOSIASTAImage = DULIOSIASTAimageCache.object(forKey: urlDULIOSIASTAString as NSString) {
            imageView.image = cachedDULIOSIASTAImage
            return
        }
        
        DispatchQueue.global().async {
            if let DULIOSIASTAdata = try? Data(contentsOf: DULIOSIASTAurl),
               let DULIOSIASTAimage = UIImage(data: DULIOSIASTAdata) {
                
                // 缓存图片
                DULIOSIASTAimageCache.setObject(DULIOSIASTAimage, forKey: urlDULIOSIASTAString as NSString)
                
                // 主线程更新UI
                DispatchQueue.main.async {
                    UIView.transition(with: imageView,
                                    duration: 0.3,
                                    options: .transitionCrossDissolve) {
                        imageView.image = DULIOSIASTAimage
                    }
                }
            }
        }
    }
}
