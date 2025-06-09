//
//  PitchDoHUD.swift
//  DJWaveCow
//

//

import UIKit
import MBProgressHUD

class PitchDoHUD{
    
    // MARK: - Show Loading HUD
    static func showBeatLoading(on view: UIView,
                              title: String = "",
                              detail: String = "") {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .indeterminate
        hud.label.text = title
        hud.detailsLabel.text = detail
        hud.contentColor = .white
        hud.bezelView.style = .solidColor
        hud.bezelView.color = UIColor(white: 0, alpha: 0.8)
        hud.minShowTime = 0.5
        
        // Custom DJ icon (optional)
        hud.customView = UIImageView(image: UIImage(named: "vinyl_icon"))
        hud.mode = .customView
    }
    
    // MARK: - Show Success HUD
    static func showDropSuccess(on view: UIView,
                              title: String = "",
                              detail: String? = nil,
                              duration: TimeInterval = 2.0) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView
        hud.customView = UIImageView(image: UIImage(named: "lowLatency"))
        hud.label.text = title
        hud.detailsLabel.text = detail
        hud.contentColor = UIColor.systemGreen
        hud.bezelView.style = .blur
        
        // Pulse animation
        UIView.animate(withDuration: 0.3, delay: 0, options: [.autoreverse, .repeat]) {
            hud.customView?.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }
        
        hud.hide(animated: true, afterDelay: duration)
    }
    
    // MARK: - Show Error HUD
    static func showMixFailed(on view: UIView,
                            title: String = "",
                            detail: String? = "",
                            duration: TimeInterval = 3.0) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView
        hud.customView = UIImageView(image: UIImage(named: "penPressure"))
        hud.label.text = title
        hud.detailsLabel.text = detail
        hud.contentColor = UIColor.init(white: 0.2, alpha: 1)
        hud.bezelView.style = .solidColor
        hud.bezelView.color = UIColor(red: 0.8, green: 0, blue: 0, alpha: 0.9)
        
        
        hud.hide(animated: true, afterDelay: duration)
    }
    
    // MARK: - Hide HUD
    static func hideHUD(for view: UIView, animated: Bool = true) {
        MBProgressHUD.hide(for: view, animated: animated)
    }
}
