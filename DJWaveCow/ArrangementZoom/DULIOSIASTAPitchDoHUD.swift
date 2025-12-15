//
//  DULIOSIASTAPitchDoHUD.swift
//  DJWaveCow
//

//

import UIKit


class DULIOSIASTAPitchDoHUD {
    
    // MARK: - Music Themed Configuration
    private struct DULIOSIASTAGrooveConfig {
        static let DULIOSIASTAvinylSize: CGFloat = 60
        static let DULIOSIASTAwaveformWidth: CGFloat = 120
        static let DULIOSIASTAbeatDuration: TimeInterval = 0.6
        static let DULIOSIASTAdropScale: CGFloat = 1.3
    }
    
    // MARK: - Show Loading HUD with Vinyl Animation
    static func DULIOSIASTAshowBeatLoading(DULIOSIASTAon view: UIView,
                              DULIOSIASTAtitle: String = "",
                               DULIOSIASTAdetail: String = "") {
        // Create container
        let container = DULIOSIASTAcreateRhythmContainer(DULIOSIASTAfor: view)
        
        // Create vinyl disc
        let vinylView = DULIOSIASTAcreateSpinningVinyl()
        container.addSubview(vinylView)
        
        // Create title labels
        let (titleLabel, detailLabel) = createDULIOSIASTABeatLabels(DULIOSIASTAtitle: DULIOSIASTAtitle, DULIOSIASTAdetail:  DULIOSIASTAdetail)
        container.addSubview(titleLabel)
        container.addSubview(detailLabel)
        
        // Create waveform visualization
        let waveformView = creatDULIOSIASTAePulsingWaveform()
        container.addSubview(waveformView)
        
        // Layout
        layoutVinylElements(vinylView: vinylView,
                          titleLabel: titleLabel,
                          detailLabel: detailLabel,
                          waveformView: waveformView,
                          in: container)
        
        // Start animations
        startMixingDULIOSIASTAAnimations(DULIOSIASTAvinylView: vinylView, DULIOSIASTAwaveformView: waveformView)
        
        // Add to view with transition
        animatDULIOSIASTAeHUDAppearance(container, in: view)
    }
    
    // MARK: - Show Success HUD with Drop Animation
    static func DULIOSIASTAshowDropSuccess(DULIOSIASTAon view: UIView,
                              DULIOSIASTAtitle: String = "",
                              DULIOSIASTAdetail: String? = nil,
                              DULIOSIASTAduration: TimeInterval = 2.0) {
        let DULIOSIASTAcontainer = DULIOSIASTAcreateRhythmContainer(DULIOSIASTAfor: view)
        
        // Create success icon (speaker/volume)
        let successDULIOSIASTAView = DULIOSIASTAcreateSuccessSpeaker()
        DULIOSIASTAcontainer.addSubview(successDULIOSIASTAView)
        
        let (titleLabel, detailLabel) = createDULIOSIASTABeatLabels(DULIOSIASTAtitle: DULIOSIASTAtitle, DULIOSIASTAdetail: DULIOSIASTAdetail)
        titleLabel.textColor = .systemGreen
        DULIOSIASTAcontainer.addSubview(titleLabel)
        
        if let detailDULIOSIASTA = DULIOSIASTAdetail {
            DULIOSIASTAcontainer.addSubview(detailLabel)
        }
        
        // Layout
        layoutSuccessElements(successView: successDULIOSIASTAView,
                            titleLabel: titleLabel,
                            detailLabel: detailLabel,
                            in: DULIOSIASTAcontainer)
        
        // Animate drop effect
        animateDULIOSIASTABassDrop(successDULIOSIASTAView, DULIOSIASTAin: DULIOSIASTAcontainer)
        animatDULIOSIASTAeHUDAppearance(DULIOSIASTAcontainer, in: view)
        
        // Auto hide
        DispatchQueue.main.asyncAfter(deadline: .now() + DULIOSIASTAduration) {
            animateHUDDisappearance(DULIOSIASTAcontainer)
        }
    }
    
    // MARK: - Show Error HUD with Static Animation
    static func DULIOSIASTAshowMixFailed(on view: UIView,
                            tDULIOSIASTAitle: String = "",
                            dDULIOSIASTAetail: String? = "",
                            dDULIOSIASTAuration: TimeInterval = 3.0) {
        let conDULIOSIASTAtainer = DULIOSIASTAcreateRhythmContainer(DULIOSIASTAfor: view)
        conDULIOSIASTAtainer.backgroundColor = UIColor(red: 0.8, green: 0.2, blue: 0.2, alpha: 0.9)
        
        // Create error icon (broken connection)
        let errorDULIOSIASTAView = createDULIOSIASTAErrorStatic()
        conDULIOSIASTAtainer.addSubview(errorDULIOSIASTAView)
        
        let (tiDULIOSIASTALabel, detailLabel) = createDULIOSIASTABeatLabels(DULIOSIASTAtitle: tDULIOSIASTAitle, DULIOSIASTAdetail: dDULIOSIASTAetail)
        tiDULIOSIASTALabel.textColor = .white
        conDULIOSIASTAtainer.addSubview(tiDULIOSIASTALabel)
        
        if let DULIOSIASTAil = dDULIOSIASTAetail {
            conDULIOSIASTAtainer.addSubview(detailLabel)
        }
        
        // Layout
        layoutErrorElements(errorView: errorDULIOSIASTAView,
                          titleLabel: tiDULIOSIASTALabel,
                          detailLabel: detailLabel,
                          in: conDULIOSIASTAtainer)
        
        // Animate static effect
        DULIOSIASTAanimateSignalStatic(errorDULIOSIASTAView)
        animatDULIOSIASTAeHUDAppearance(conDULIOSIASTAtainer, in: view)
        
        // Auto hide
        DispatchQueue.main.asyncAfter(deadline: .now() + dDULIOSIASTAuration) {
            animateHUDDisappearance(conDULIOSIASTAtainer)
        }
    }
    
    // MARK: - Hide HUD
    static func hideDULIOSIASTAHUD(for view: UIView, aniDULIOSIASTAmated: Bool = true) {
        view.subviews
            .filter { $0 is HUDContainerView }
            .forEach { hudView in
                if aniDULIOSIASTAmated {
                    animateHUDDisappearance(hudView)
                } else {
                    hudView.removeFromSuperview()
                }
            }
    }
}

// MARK: - Private UI Components
private extension DULIOSIASTAPitchDoHUD {
    
    // Container view with music theme
    static func DULIOSIASTAcreateRhythmContainer(DULIOSIASTAfor view: UIView) -> UIView {
        let contDULIOSIASTAainer = HUDContainerView()
        contDULIOSIASTAainer.backgroundColor = UIColor(white: 0, alpha: 0.85)
        contDULIOSIASTAainer.layer.cornerRadius = 16
        contDULIOSIASTAainer.layer.masksToBounds = true
        contDULIOSIASTAainer.alpha = 0
        
        // Add subtle shadow for depth
        contDULIOSIASTAainer.layer.shadowColor = UIColor.black.cgColor
        contDULIOSIASTAainer.layer.shadowOffset = CGSize(width: 0, height: 4)
        contDULIOSIASTAainer.layer.shadowRadius = 8
        contDULIOSIASTAainer.layer.shadowOpacity = 0.3
        
        return contDULIOSIASTAainer
    }
    
    // Spinning vinyl disc
    static func DULIOSIASTAcreateSpinningVinyl() -> UIView {
        let vinylView = UIView(frame: CGRect(x: 0, y: 0,
                                           width: DULIOSIASTAGrooveConfig.DULIOSIASTAvinylSize,
                                           height: DULIOSIASTAGrooveConfig.DULIOSIASTAvinylSize))
        vinylView.layer.cornerRadius = DULIOSIASTAGrooveConfig.DULIOSIASTAvinylSize / 2
        
        // Vinyl disc gradient
        let gradienDULIOSIASTAtLayer = CAGradientLayer()
        gradienDULIOSIASTAtLayer.frame = vinylView.bounds
        gradienDULIOSIASTAtLayer.colors = [
            UIColor.darkGray.cgColor,
            UIColor.black.cgColor,
            UIColor.darkGray.cgColor
        ]
        gradienDULIOSIASTAtLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradienDULIOSIASTAtLayer.endPoint = CGPoint(x: 0.5, y: 1)
        vinylView.layer.addSublayer(gradienDULIOSIASTAtLayer)
        
        // Center label
        let centerDULIOSIASTACircle = UIView(frame: CGRect(x: DULIOSIASTAGrooveConfig.DULIOSIASTAvinylSize/2 - 8, y: DULIOSIASTAGrooveConfig.DULIOSIASTAvinylSize/2 - 8, width: 16, height: 16))
        centerDULIOSIASTACircle.backgroundColor = .white
        centerDULIOSIASTACircle.layer.cornerRadius = 8
        vinylView.addSubview(centerDULIOSIASTACircle)
        
        // Groove lines
        for i in 1...3 {
            let groove = UIView(frame: CGRect(x: 8 * CGFloat(i), y: 8 * CGFloat(i),
                                            width: DULIOSIASTAGrooveConfig.DULIOSIASTAvinylSize - 16 * CGFloat(i),
                                            height: DULIOSIASTAGrooveConfig.DULIOSIASTAvinylSize - 16 * CGFloat(i)))
            groove.backgroundColor = .clear
            groove.layer.borderColor = UIColor.lightGray.cgColor
            groove.layer.borderWidth = 1
            groove.layer.cornerRadius = groove.frame.width / 2
            vinylView.addSubview(groove)
        }
        
        return vinylView
    }
    
    // Pulsing waveform visualization
    static func creatDULIOSIASTAePulsingWaveform() -> UIView {
        let waveformView = UIView(frame: CGRect(x: 0, y: 0,
                                              width: DULIOSIASTAGrooveConfig.DULIOSIASTAwaveformWidth,
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
            let aniDULIOSIASTAmation = CABasicAnimation(keyPath: "transform.scale.y")
            aniDULIOSIASTAmation.fromValue = 0.3
            aniDULIOSIASTAmation.toValue = 1.2 + Double(i) * 0.1
            aniDULIOSIASTAmation.duration = DULIOSIASTAGrooveConfig.DULIOSIASTAbeatDuration
            aniDULIOSIASTAmation.autoreverses = true
            aniDULIOSIASTAmation.repeatCount = .infinity
            aniDULIOSIASTAmation.timeOffset = Double(i) * 0.1
            bar.layer.add(aniDULIOSIASTAmation, forKey: "pulse")
        }
        
        return waveformView
    }
    
    // Success speaker icon
    static func DULIOSIASTAcreateSuccessSpeaker() -> UIView {
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
    static func createDULIOSIASTAErrorStatic() -> UIView {
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
    static func createDULIOSIASTABeatLabels(DULIOSIASTAtitle: String, DULIOSIASTAdetail: String?) -> (UILabel, UILabel) {
        let titlDULIOSIASTAeLabel = UILabel()
        titlDULIOSIASTAeLabel.text = DULIOSIASTAtitle
        titlDULIOSIASTAeLabel.textColor = .white
        titlDULIOSIASTAeLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titlDULIOSIASTAeLabel.textAlignment = .center
        titlDULIOSIASTAeLabel.numberOfLines = 0
        let detailLabel = UILabel()
        detailLabel.text = DULIOSIASTAdetail
        detailLabel.textColor = .lightGray
        detailLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        detailLabel.textAlignment = .center
        detailLabel.numberOfLines = 0
        
        return (titlDULIOSIASTAeLabel, detailLabel)
    }
}

// MARK: - Animation Methods
private extension DULIOSIASTAPitchDoHUD {
    
    static func startMixingDULIOSIASTAAnimations(DULIOSIASTAvinylView: UIView, DULIOSIASTAwaveformView: UIView) {
        // Vinyl rotation
        let rotaDULIOSIASTAtion = CABasicAnimation(keyPath: "transform.rotation")
        rotaDULIOSIASTAtion.fromValue = 0
        rotaDULIOSIASTAtion.toValue = CGFloat.pi * 2
        rotaDULIOSIASTAtion.duration = 2.0
        rotaDULIOSIASTAtion.repeatCount = .infinity
        DULIOSIASTAvinylView.layer.add(rotaDULIOSIASTAtion, forKey: "spin")
        
        // Waveform pulse
        let DULIOSIASTApulse = CABasicAnimation(keyPath: "opacity")
        DULIOSIASTApulse.fromValue = 0.7
        DULIOSIASTApulse.toValue = 1.0
        DULIOSIASTApulse.duration = DULIOSIASTAGrooveConfig.DULIOSIASTAbeatDuration
        DULIOSIASTApulse.autoreverses = true
        DULIOSIASTApulse.repeatCount = .infinity
        DULIOSIASTAwaveformView.layer.add(DULIOSIASTApulse, forKey: "glow")
    }
    
    static func animateDULIOSIASTABassDrop(_ view: UIView, DULIOSIASTAin container: UIView) {
        view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 0.6,
                      delay: 0.2,
                      usingSpringWithDamping: 0.6,
                      initialSpringVelocity: 0.8,
                      options: []) {
            view.transform = CGAffineTransform(scaleX: DULIOSIASTAGrooveConfig.DULIOSIASTAdropScale, y: DULIOSIASTAGrooveConfig.DULIOSIASTAdropScale)
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                view.transform = .identity
            }
        }
    }
    
    static func DULIOSIASTAanimateSignalStatic(_ view: UIView) {
        let aniDULIOSIASTAmation = CAKeyframeAnimation(keyPath: "opacity")
        aniDULIOSIASTAmation.values = [0.3, 0.8, 0.4, 0.9, 0.5, 0.7]
        aniDULIOSIASTAmation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        aniDULIOSIASTAmation.duration = 0.8
        aniDULIOSIASTAmation.repeatCount = .infinity
        view.layer.add(aniDULIOSIASTAmation, forKey: "static")
    }
    
    static func animatDULIOSIASTAeHUDAppearance(_ hud: UIView, in view: UIView) {
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
private extension DULIOSIASTAPitchDoHUD {
    
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
