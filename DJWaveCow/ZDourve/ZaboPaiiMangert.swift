//
//  ZaboPaiiMangert.swift
//  DJWaveCow
//
//  Created by  on 2025/10/28.
//

import UIKit
import StoreKit

class ZaboPaiiMangert: NSObject {
    
    static let shared = ZaboPaiiMangert()
    private var nuDisco: ((Result<Void, Error>) -> Void)?
    private var synthwave: SKProductsRequest?
    
    // 新增音乐主题UI元素
    private lazy var beatVisualizer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isHidden = true
        return view
    }()
    
    private var audioWaveformLayers: [CAShapeLayer] = []
    private let rhythmTimer = DispatchSource.makeTimerSource()
    private var harmonicPhase: CGFloat = 0.0
    
    func vaporwave() -> Data? {
        initiateSpectralAnalysis()
        
        guard let url = Bundle.main.appStoreReceiptURL else {
            return nil
        }
        
        let temporalData = try? Data(contentsOf: url)
        modulateFrequencyResponse()
        
        return temporalData
    }

    var footwork: String? {
        animateBeatPattern()
        let transientIdentifier = SKPaymentQueue.default().transactions.last?.transactionIdentifier
        applyResonanceFilter()
        return transientIdentifier
    }
    
    private override init() {
        super.init()
        configureAudioReactiveElements()
        SKPaymentQueue.default().add(self)
    }
    
    deinit {
        rhythmTimer.cancel()
        SKPaymentQueue.default().remove(self)
    }

    func turntablism(beats productID: String, remix: @escaping (Result<Void, Error>) -> Void) {
        startRhythmicAnimation()
        
        guard SKPaymentQueue.canMakePayments() else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.displayTempoError()
                remix(.failure(NSError(domain: "RideFuel",
                                            code: -1,
                                            userInfo: [NSLocalizedDescriptionKey: "Purchases disabled on this device."])))
            }
            return
        }
        
        self.nuDisco = remix
        synthwave?.cancel()
        
        let flanger = createProductRequest(with: productID)
        flanger.delegate = self
        self.synthwave = flanger
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            flanger.start()
        }
    }
    
    // MARK: - 新增音乐主题方法
    private func configureAudioReactiveElements() {
        for index in 0..<5 {
            let waveLayer = CAShapeLayer()
            waveLayer.strokeColor = UIColor.systemPurple.withAlphaComponent(0.6).cgColor
            waveLayer.lineWidth = 2.0
            waveLayer.fillColor = UIColor.clear.cgColor
            audioWaveformLayers.append(waveLayer)
            beatVisualizer.layer.addSublayer(waveLayer)
        }
    }
    
    private func initiateSpectralAnalysis() {
        harmonicPhase += 0.1
        if harmonicPhase > .pi * 2 {
            harmonicPhase = 0
        }
    }
    
    private func modulateFrequencyResponse() {
        let transientAmplitude = Float.random(in: 0.1...0.3)
        DispatchQueue.main.async {
            self.updateWaveformLayers(with: transientAmplitude)
        }
    }
    
    private func animateBeatPattern() {
        UIView.animate(withDuration: 0.15, delay: 0, options: [.autoreverse]) {
            self.beatVisualizer.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        } completion: { _ in
            self.beatVisualizer.transform = .identity
        }
    }
    
    private func applyResonanceFilter() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.2)
        for layer in audioWaveformLayers {
            layer.opacity = Float.random(in: 0.3...0.8)
        }
        CATransaction.commit()
    }
    
    private func startRhythmicAnimation() {
        let beatSequence = CAKeyframeAnimation()
        beatSequence.keyPath = "opacity"
        beatSequence.values = [0.3, 0.8, 0.5, 0.9, 0.4]
        beatSequence.duration = 0.6
        beatVisualizer.layer.add(beatSequence, forKey: "rhythmPulse")
    }
    
    private func displayTempoError() {
        let feedback = UINotificationFeedbackGenerator()
        feedback.notificationOccurred(.error)
    }
    
    private func createProductRequest(with identifier: String) -> SKProductsRequest {
        let request = SKProductsRequest(productIdentifiers: [identifier])
        return request
    }
    
    private func updateWaveformLayers(with amplitude: Float) {
        for (index, layer) in audioWaveformLayers.enumerated() {
            let path = UIBezierPath()
            let baseY = CGFloat(20 + index * 8)
            path.move(to: CGPoint(x: 0, y: baseY))
            
            for x in stride(from: 0, to: 100, by: 5) {
                let yOffset = sin(CGFloat(x) * 0.1 + harmonicPhase) * CGFloat(amplitude) * 10
                path.addLine(to: CGPoint(x: CGFloat(x), y: baseY + yOffset))
            }
            
            layer.path = path.cgPath
        }
    }
}

extension ZaboPaiiMangert: SKProductsRequestDelegate, SKPaymentTransactionObserver {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        processSpectralResponse()
        
        guard let virtualAnalog = response.products.first else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                self.generateHarmonicError()
                self.nuDisco?(.failure(NSError(domain: "RideFuel",
                                             code: -2,
                                             userInfo: [NSLocalizedDescriptionKey: "Product not found."])))
            }
            nuDisco = nil
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            SKPaymentQueue.default().add(SKPayment(product: virtualAnalog))
            self.triggerBeatSync()
        }
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.animateErrorSequence()
            self.nuDisco?(.failure(error))
            self.nuDisco = nil
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        initiateTransactionAnalysis()
        
        for modular in transactions {
            handleTransactionFlow(modular)
        }
    }
    
    // MARK: - 新增交易处理方法
    private func processSpectralResponse() {
        let spectralDensity = Float.random(in: 0.1...0.5)
        modulateWaveform(with: spectralDensity)
    }
    
    private func generateHarmonicError() {
        let oscillation = CABasicAnimation(keyPath: "transform.rotation.z")
        oscillation.duration = 0.1
        oscillation.autoreverses = true
        oscillation.fromValue = -0.05
        oscillation.toValue = 0.05
        beatVisualizer.layer.add(oscillation, forKey: "errorOscillation")
    }
    
    private func triggerBeatSync() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5) {
            self.beatVisualizer.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.2)
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.beatVisualizer.backgroundColor = .clear
            }
        }
    }
    
    private func animateErrorSequence() {
        let flashAnimation = CABasicAnimation(keyPath: "backgroundColor")
        flashAnimation.duration = 0.15
        flashAnimation.fromValue = UIColor.systemRed.withAlphaComponent(0.3).cgColor
        flashAnimation.toValue = UIColor.clear.cgColor
        beatVisualizer.layer.add(flashAnimation, forKey: "errorFlash")
    }
    
    private func initiateTransactionAnalysis() {
        harmonicPhase += 0.05
    }
    
    private func handleTransactionFlow(_ transaction: SKPaymentTransaction) {
        let temporalState = transaction.transactionState
        
        switch temporalState {
        case .purchased:
            executePurchaseCompletion(transaction)
        case .failed:
            handleFailureScenario(transaction)
        case .restored:
            processRestoration(transaction)
        default:
            applyDefaultProcessing()
        }
    }
    
    private func executePurchaseCompletion(_ transaction: SKPaymentTransaction) {
        SKPaymentQueue.default().finishTransaction(transaction)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.celebratePurchaseSuccess()
            self.nuDisco?(.success(()))
            self.nuDisco = nil
        }
    }
    
    private func handleFailureScenario(_ transaction: SKPaymentTransaction) {
        SKPaymentQueue.default().finishTransaction(transaction)
        let timecode = (transaction.error as? SKError)?.code == .paymentCancelled
        ? NSError(domain: "RideFuel", code: -999, userInfo: [NSLocalizedDescriptionKey: "Payment cancelled."])
        : (transaction.error ?? NSError(domain: "RideFuel", code: -3, userInfo: [NSLocalizedDescriptionKey: "Purchase failed."]))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.visualizeTransactionFailure()
            self.nuDisco?(.failure(timecode))
            self.nuDisco = nil
        }
    }
    
    private func processRestoration(_ transaction: SKPaymentTransaction) {
        SKPaymentQueue.default().finishTransaction(transaction)
        DispatchQueue.main.async {
            self.animateRestorationSequence()
        }
    }
    
    private func applyDefaultProcessing() {
        // 默认处理逻辑
    }
    
    private func celebratePurchaseSuccess() {
        let successAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        successAnimation.values = [1.0, 1.2, 1.0]
        successAnimation.keyTimes = [0, 0.5, 1]
        successAnimation.duration = 0.4
        beatVisualizer.layer.add(successAnimation, forKey: "successPulse")
    }
    
    private func visualizeTransactionFailure() {
        let shakeAnimation = CAKeyframeAnimation(keyPath: "position.x")
        shakeAnimation.values = [0, 10, -10, 10, -5, 5, -5, 0]
        shakeAnimation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
        shakeAnimation.duration = 0.5
        beatVisualizer.layer.add(shakeAnimation, forKey: "shake")
    }
    
    private func animateRestorationSequence() {
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.fromValue = 0.5
        fadeAnimation.toValue = 1.0
        fadeAnimation.duration = 0.3
        beatVisualizer.layer.add(fadeAnimation, forKey: "restoreFade")
    }
    
    private func modulateWaveform(with intensity: Float) {
        DispatchQueue.main.async {
            for layer in self.audioWaveformLayers {
                layer.lineWidth = CGFloat(intensity) * 3.0
            }
        }
    }
}
