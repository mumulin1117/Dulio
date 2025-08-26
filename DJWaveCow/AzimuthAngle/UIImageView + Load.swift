//
//  UIImageView + Load.swift
//  DJWaveCow
//
//  Created by  on 2025/6/6.
//

import UIKit
import SDWebImage
extension Float {
    func clamped(to range: ClosedRange<Float>) -> Float {
        min(max(self, range.lowerBound), range.upperBound)
    }
}
// MARK: - Image Loading with Cache Strategies
extension UIImageView {
    
    // MARK: - Cache Strategy Options
    enum CacheStrategy {
        case `default`       // Memory + Disk (default SDWebImage behavior)
        case memoryOnly      // Only use memory cache
        case diskOnly        // Only use disk cache
        case refreshCache    // Refresh cached data
        case lowPriority     // Low priority download
    }

    // MARK: - Music-Themed Placeholders
    enum DJPlaceholder {
        case vinyl          // Vinyl record placeholder
        case equalizer      // EQ visualization
        case waveform       // Audio waveform
    }
    
    func DJloadDJImage(
        DJurl: URL?,
        cacheStrategy: CacheStrategy = .default,
        placeholder: DJPlaceholder = .vinyl
    ) {
        
        var options: SDWebImageOptions = []
        
        switch cacheStrategy {
        case .default:
            options = [.retryFailed, .highPriority]
        case .memoryOnly:
            options = [.queryMemoryData, .queryMemoryData]
        case .diskOnly:
            options = [.queryDiskDataSync]
        case .refreshCache:
            options = [.refreshCached, .progressiveLoad]
        case .lowPriority:
            options = [.lowPriority, .delayPlaceholder]
        }
        
       
        
        // 3. Configure transition animation
        let transition = SDWebImageTransition.fade(duration: 0.3)
        self.sd_imageTransition = transition
        
        // 4. Load image with selected options
        self.sd_setImage(
            with: DJurl,
            placeholderImage: nil,
            options: options,
            completed: { [weak self] (image, error, cacheType, url) in
                if let error = error {
                    print("🎛️ Image load failed: \(error.localizedDescription)")
                    self?.image = UIImage(named: "load_failed")
                } else {
                    // Optional: Add beat animation on successful load
                    UIView.animate(withDuration: 0.2, animations: {
                        self?.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                    }, completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self?.transform = .identity
                        }
                    })
                }
            }
        )
    }

}


