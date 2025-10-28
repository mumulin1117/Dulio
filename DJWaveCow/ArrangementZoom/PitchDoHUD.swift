//
//  PitchDoHUD.swift
//  DJWaveCow
//

//

import UIKit


class PitchDoHUD {
    
    // MARK: - Music Themed Configuration
    private struct GrooveConfig {
        static let vinylSize: CGFloat = 60
        static let waveformWidth: CGFloat = 120
        static let beatDuration: TimeInterval = 0.6
        static let dropScale: CGFloat = 1.3
    }
    
    // MARK: - Show Loading HUD with Vinyl Animation
    static func showBeatLoading(on view: UIView,
                              title: String = "",
                              detail: String = "") {
        // Create container
        let container = createRhythmContainer(for: view)
        
        // Create vinyl disc
        let vinylView = createSpinningVinyl()
        container.addSubview(vinylView)
        
        // Create title labels
        let (titleLabel, detailLabel) = createBeatLabels(title: title, detail: detail)
        container.addSubview(titleLabel)
        container.addSubview(detailLabel)
        
        // Create waveform visualization
        let waveformView = createPulsingWaveform()
        container.addSubview(waveformView)
        
        // Layout
        layoutVinylElements(vinylView: vinylView,
                          titleLabel: titleLabel,
                          detailLabel: detailLabel,
                          waveformView: waveformView,
                          in: container)
        
        // Start animations
        startMixingAnimations(vinylView: vinylView, waveformView: waveformView)
        
        // Add to view with transition
        animateHUDAppearance(container, in: view)
    }
    
    // MARK: - Show Success HUD with Drop Animation
    static func showDropSuccess(on view: UIView,
                              title: String = "",
                              detail: String? = nil,
                              duration: TimeInterval = 2.0) {
        let container = createRhythmContainer(for: view)
        
        // Create success icon (speaker/volume)
        let successView = createSuccessSpeaker()
        container.addSubview(successView)
        
        let (titleLabel, detailLabel) = createBeatLabels(title: title, detail: detail)
        titleLabel.textColor = .systemGreen
        container.addSubview(titleLabel)
        
        if let detail = detail {
            container.addSubview(detailLabel)
        }
        
        // Layout
        layoutSuccessElements(successView: successView,
                            titleLabel: titleLabel,
                            detailLabel: detailLabel,
                            in: container)
        
        // Animate drop effect
        animateBassDrop(successView, in: container)
        animateHUDAppearance(container, in: view)
        
        // Auto hide
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            animateHUDDisappearance(container)
        }
    }
    
    // MARK: - Show Error HUD with Static Animation
    static func showMixFailed(on view: UIView,
                            title: String = "",
                            detail: String? = "",
                            duration: TimeInterval = 3.0) {
        let container = createRhythmContainer(for: view)
        container.backgroundColor = UIColor(red: 0.8, green: 0.2, blue: 0.2, alpha: 0.9)
        
        // Create error icon (broken connection)
        let errorView = createErrorStatic()
        container.addSubview(errorView)
        
        let (titleLabel, detailLabel) = createBeatLabels(title: title, detail: detail)
        titleLabel.textColor = .white
        container.addSubview(titleLabel)
        
        if let detail = detail {
            container.addSubview(detailLabel)
        }
        
        // Layout
        layoutErrorElements(errorView: errorView,
                          titleLabel: titleLabel,
                          detailLabel: detailLabel,
                          in: container)
        
        // Animate static effect
        animateSignalStatic(errorView)
        animateHUDAppearance(container, in: view)
        
        // Auto hide
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            animateHUDDisappearance(container)
        }
    }
    
    // MARK: - Hide HUD
    static func hideHUD(for view: UIView, animated: Bool = true) {
        view.subviews
            .filter { $0 is HUDContainerView }
            .forEach { hudView in
                if animated {
                    animateHUDDisappearance(hudView)
                } else {
                    hudView.removeFromSuperview()
                }
            }
    }
}

// MARK: - Private UI Components
private extension PitchDoHUD {
    
    // Container view with music theme
    static func createRhythmContainer(for view: UIView) -> UIView {
        let container = HUDContainerView()
        container.backgroundColor = UIColor(white: 0, alpha: 0.85)
        container.layer.cornerRadius = 16
        container.layer.masksToBounds = true
        container.alpha = 0
        
        // Add subtle shadow for depth
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOffset = CGSize(width: 0, height: 4)
        container.layer.shadowRadius = 8
        container.layer.shadowOpacity = 0.3
        
        return container
    }
    
    // Spinning vinyl disc
    static func createSpinningVinyl() -> UIView {
        let vinylView = UIView(frame: CGRect(x: 0, y: 0,
                                           width: GrooveConfig.vinylSize,
                                           height: GrooveConfig.vinylSize))
        vinylView.layer.cornerRadius = GrooveConfig.vinylSize / 2
        
        // Vinyl disc gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = vinylView.bounds
        gradientLayer.colors = [
            UIColor.darkGray.cgColor,
            UIColor.black.cgColor,
            UIColor.darkGray.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        vinylView.layer.addSublayer(gradientLayer)
        
        // Center label
        let centerCircle = UIView(frame: CGRect(x: GrooveConfig.vinylSize/2 - 8, y: GrooveConfig.vinylSize/2 - 8, width: 16, height: 16))
        centerCircle.backgroundColor = .white
        centerCircle.layer.cornerRadius = 8
        vinylView.addSubview(centerCircle)
        
        // Groove lines
        for i in 1...3 {
            let groove = UIView(frame: CGRect(x: 8 * CGFloat(i), y: 8 * CGFloat(i),
                                            width: GrooveConfig.vinylSize - 16 * CGFloat(i),
                                            height: GrooveConfig.vinylSize - 16 * CGFloat(i)))
            groove.backgroundColor = .clear
            groove.layer.borderColor = UIColor.lightGray.cgColor
            groove.layer.borderWidth = 1
            groove.layer.cornerRadius = groove.frame.width / 2
            vinylView.addSubview(groove)
        }
        
        return vinylView
    }
    
    // Pulsing waveform visualization
    static func createPulsingWaveform() -> UIView {
        let waveformView = UIView(frame: CGRect(x: 0, y: 0,
                                              width: GrooveConfig.waveformWidth,
                                              height: 20))
        
        // Create multiple bars for waveform
        let barCount = 5
        let barWidth: CGFloat = 8
        let spacing: CGFloat = 4
        
        for i in 0..<barCount {
            let bar = UIView(frame: CGRect(x: CGFloat(i) * (barWidth + spacing),
                                         y: 0,
                                         width: barWidth,
                                         height: 10))
            bar.backgroundColor = .systemPurple
            bar.layer.cornerRadius = 2
            waveformView.addSubview(bar)
            
            // Individual bar animation
            let animation = CABasicAnimation(keyPath: "transform.scale.y")
            animation.fromValue = 0.3
            animation.toValue = 1.2 + Double(i) * 0.1
            animation.duration = GrooveConfig.beatDuration
            animation.autoreverses = true
            animation.repeatCount = .infinity
            animation.timeOffset = Double(i) * 0.1
            bar.layer.add(animation, forKey: "pulse")
        }
        
        return waveformView
    }
    
    // Success speaker icon
    static func createSuccessSpeaker() -> UIView {
        let speakerView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        // Speaker body
        let bodyLayer = CAShapeLayer()
        let speakerPath = UIBezierPath()
        speakerPath.move(to: CGPoint(x: 15, y: 10))
        speakerPath.addLine(to: CGPoint(x: 35, y: 10))
        speakerPath.addLine(to: CGPoint(x: 35, y: 40))
        speakerPath.addLine(to: CGPoint(x: 15, y: 40))
        speakerPath.close()
        bodyLayer.path = speakerPath.cgPath
        bodyLayer.fillColor = UIColor.systemGreen.cgColor
        speakerView.layer.addSublayer(bodyLayer)
        
        // Sound waves
        for i in 0..<3 {
            let waveLayer = CAShapeLayer()
            let wavePath = UIBezierPath()
            let startX: CGFloat = 35
            let waveHeight: CGFloat = 10 + CGFloat(i) * 8
            wavePath.move(to: CGPoint(x: startX, y: 25 - waveHeight/2))
            wavePath.addQuadCurve(to: CGPoint(x: startX + 15 + CGFloat(i) * 5, y: 25),
                                controlPoint: CGPoint(x: startX + 8, y: 25 - waveHeight/2))
            wavePath.addQuadCurve(to: CGPoint(x: startX, y: 25 + waveHeight/2),
                                controlPoint: CGPoint(x: startX + 8, y: 25 + waveHeight/2))
            waveLayer.path = wavePath.cgPath
            waveLayer.strokeColor = UIColor.systemGreen.cgColor
            waveLayer.fillColor = UIColor.clear.cgColor
            waveLayer.lineWidth = 2
            speakerView.layer.addSublayer(waveLayer)
        }
        
        return speakerView
    }
    
    // Error static visualization
    static func createErrorStatic() -> UIView {
        let staticView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        // Create multiple crossing lines for static effect
        for i in 0..<8 {
            let lineLayer = CAShapeLayer()
            let linePath = UIBezierPath()
            
            if i % 2 == 0 {
                linePath.move(to: CGPoint(x: 0, y: CGFloat(i) * 7))
                linePath.addLine(to: CGPoint(x: 50, y: CGFloat(50 - i * 7)))
            } else {
                linePath.move(to: CGPoint(x: CGFloat(i) * 7, y: 0))
                linePath.addLine(to: CGPoint(x: CGFloat(50 - i * 7), y: 50))
            }
            
            lineLayer.path = linePath.cgPath
            lineLayer.strokeColor = UIColor.white.cgColor
            lineLayer.lineWidth = 1.5
            lineLayer.opacity = Float.random(in: 0.3...0.8)
            staticView.layer.addSublayer(lineLayer)
        }
        
        return staticView
    }
    
    // Create music-themed labels
    static func createBeatLabels(title: String, detail: String?) -> (UILabel, UILabel) {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        let detailLabel = UILabel()
        detailLabel.text = detail
        detailLabel.textColor = .lightGray
        detailLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        detailLabel.textAlignment = .center
        detailLabel.numberOfLines = 0
        
        return (titleLabel, detailLabel)
    }
}

// MARK: - Animation Methods
private extension PitchDoHUD {
    
    static func startMixingAnimations(vinylView: UIView, waveformView: UIView) {
        // Vinyl rotation
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = CGFloat.pi * 2
        rotation.duration = 2.0
        rotation.repeatCount = .infinity
        vinylView.layer.add(rotation, forKey: "spin")
        
        // Waveform pulse
        let pulse = CABasicAnimation(keyPath: "opacity")
        pulse.fromValue = 0.7
        pulse.toValue = 1.0
        pulse.duration = GrooveConfig.beatDuration
        pulse.autoreverses = true
        pulse.repeatCount = .infinity
        waveformView.layer.add(pulse, forKey: "glow")
    }
    
    static func animateBassDrop(_ view: UIView, in container: UIView) {
        view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 0.6,
                      delay: 0.2,
                      usingSpringWithDamping: 0.6,
                      initialSpringVelocity: 0.8,
                      options: []) {
            view.transform = CGAffineTransform(scaleX: GrooveConfig.dropScale, y: GrooveConfig.dropScale)
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                view.transform = .identity
            }
        }
    }
    
    static func animateSignalStatic(_ view: UIView) {
        let animation = CAKeyframeAnimation(keyPath: "opacity")
        animation.values = [0.3, 0.8, 0.4, 0.9, 0.5, 0.7]
        animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        animation.duration = 0.8
        animation.repeatCount = .infinity
        view.layer.add(animation, forKey: "static")
    }
    
    static func animateHUDAppearance(_ hud: UIView, in view: UIView) {
        view.addSubview(hud)
        hud.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
        
        hud.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.3,
                      delay: 0,
                      usingSpringWithDamping: 0.7,
                      initialSpringVelocity: 0.5,
                      options: []) {
            hud.alpha = 1
            hud.transform = .identity
        }
    }
    
    static func animateHUDDisappearance(_ hud: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            hud.alpha = 0
            hud.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }) { _ in
            hud.removeFromSuperview()
        }
    }
}

// MARK: - Layout Methods
private extension PitchDoHUD {
    
    static func layoutVinylElements(vinylView: UIView,
                                  titleLabel: UILabel,
                                  detailLabel: UILabel,
                                  waveformView: UIView,
                                  in container: UIView) {
        container.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        vinylView.center = CGPoint(x: 100, y: 60)
        waveformView.center = CGPoint(x: 100, y: 110)
        titleLabel.frame = CGRect(x: 20, y: 130, width: 160, height: 20)
        detailLabel.frame = CGRect(x: 20, y: 150, width: 160, height: 50)
    }
    
    static func layoutSuccessElements(successView: UIView,
                                    titleLabel: UILabel,
                                    detailLabel: UILabel,
                                    in container: UIView) {
        container.frame = CGRect(x: 0, y: 0, width: 160, height: 160)
        
        successView.center = CGPoint(x: 80, y: 50)
        titleLabel.frame = CGRect(x: 20, y: 90, width: 120, height: 20)
        detailLabel.frame = CGRect(x: 20, y: 110, width: 120, height: 50)
    }
    
    static func layoutErrorElements(errorView: UIView,
                                  titleLabel: UILabel,
                                  detailLabel: UILabel,
                                  in container: UIView) {
        container.frame = CGRect(x: 0, y: 0, width: 180, height: 160)
        
        errorView.center = CGPoint(x: 90, y: 50)
        titleLabel.frame = CGRect(x: 20, y: 90, width: 140, height: 20)
        detailLabel.frame = CGRect(x: 20, y: 110, width: 140, height: 50)
    }
}

// MARK: - Custom Container View
private class HUDContainerView: UIView {
    // Custom container for easy identification and management
}
