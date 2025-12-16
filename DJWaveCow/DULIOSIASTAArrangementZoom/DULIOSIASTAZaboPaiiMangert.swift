//
//  DULIOSIASTAZaboPaiiMangert.swift
//  DJWaveCow
//
//  Created by  on 2025/10/28.
//

import UIKit
import StoreKit
protocol DULIOSIASTAVinylFlowDelegate: AnyObject {
    func didSelectVinylSample(_ sample: DULIOSIASTAAudioSample)
    func didTriggerSamplePreview(_ sample: DULIOSIASTAAudioSample)
}

protocol DULIOSIASTATouchMixerResponder: AnyObject {
    func DULIOSIASTAdidAdjustFrequency(_ frequency: Float)
    func DULIOSIASTAdidTriggerLayerMute(_ layerIndex: Int)
    func DULIOSIASTAdidActivateFilter(_ filterType: DULIOSIASTAAudioFilter)
}

protocol DULIOSIASTAWaveformDelegate: AnyObject {
    func didLongPressWaveform(_ waveform: DULIOSIASTAClockWaveform)
    func didSwipeToClear()
}
class DULIOSIASTAZaboPaiiMangert: NSObject {
    
    static let shared = DULIOSIASTAZaboPaiiMangert()
    private var DULIOSIASTAnuDisco: ((Result<Void, Error>) -> Void)?
    private var DULIOSIASTAsynthwave: SKProductsRequest?
    
    // 新增音乐主题UI元素
    private lazy var DULIOSIASTAbeatVisualizer: UIView = {
        let DULIOSIASTAview = UIView()
        DULIOSIASTAview.backgroundColor = .clear
        DULIOSIASTAview.isHidden = true
        return DULIOSIASTAview
    }()
    
    private var DULIOSIASTAWaveformLayers: [CAShapeLayer] = []
    private let DULIOSIASTArhythmTimer = DispatchSource.makeTimerSource()
    private var DULIOSIASTAharmonicPhase: CGFloat = 0.0
    
    func DULIOSIASTAvaporwave() -> Data? {
        DULIOSIASTAtiateSpectralAnalysis()
        
        guard let DULIOSIASTAurl = Bundle.main.appStoreReceiptURL else {
            return nil
        }
        
        let DULIOSIASTAmporalData = try? Data(contentsOf: DULIOSIASTAurl)
        DULIOSIASTAeFrequencyResponse()
        
        return DULIOSIASTAmporalData
    }

    var DULIOSIASTAfootwork: String? {
        DULIOSIASTABeatPattern()
        let transientIdentifier = SKPaymentQueue.default().transactions.last?.transactionIdentifier
        applyDULIOSIASTAResonanceFilter()
        return transientIdentifier
    }
    
    private override init() {
        super.init()
        DULIOSIASTAreAudioReactiveElements()
        SKPaymentQueue.default().add(self)
    }
    
    deinit {
        DULIOSIASTArhythmTimer.cancel()
        SKPaymentQueue.default().remove(self)
    }

    func DULIOSIASTAturntablism(DULIOSIASTAbeats productID: String, DULIOSIASTAremix: @escaping (Result<Void, Error>) -> Void) {
        startDULIOSIASTARhythmicAnimation()
        
        guard SKPaymentQueue.canMakePayments() else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.displayDULIOSIASTATempoError()
                DULIOSIASTAremix(.failure(NSError(domain: "RideFuel",
                                            code: -1,
                                            userInfo: [NSLocalizedDescriptionKey: "Purchases disabled on this device."])))
            }
            return
        }
        
        self.DULIOSIASTAnuDisco = DULIOSIASTAremix
        DULIOSIASTAsynthwave?.cancel()
        
        let flangerDULIOSIASTA = createDULIOSIASTAProductRequest(DULIOSIASTAwith: productID)
        flangerDULIOSIASTA.delegate = self
        self.DULIOSIASTAsynthwave = flangerDULIOSIASTA
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            flangerDULIOSIASTA.start()
        }
    }
    
    // MARK: - 新增音乐主题方法
    private func DULIOSIASTAreAudioReactiveElements() {
        for index in 0..<5 {
            let DULIOSIASTAveLayer = CAShapeLayer()
            DULIOSIASTAveLayer.strokeColor = UIColor.systemPurple.withAlphaComponent(0.6).cgColor
            DULIOSIASTAveLayer.lineWidth = 2.0
            DULIOSIASTAveLayer.fillColor = UIColor.clear.cgColor
            DULIOSIASTAWaveformLayers.append(DULIOSIASTAveLayer)
            DULIOSIASTAbeatVisualizer.layer.addSublayer(DULIOSIASTAveLayer)
        }
    }
    
    private func DULIOSIASTAtiateSpectralAnalysis() {
        DULIOSIASTAharmonicPhase += 0.1
        if DULIOSIASTAharmonicPhase > .pi * 2 {
            DULIOSIASTAharmonicPhase = 0
        }
    }
    
    private func DULIOSIASTAeFrequencyResponse() {
        let DULIOSIASTAntAmplitude = Float.random(in: 0.1...0.3)
        DispatchQueue.main.async {
            self.updateDULIOSIASTAWaveformLayers(DULIOSIASTAwith: DULIOSIASTAntAmplitude)
        }
    }
    
    private func DULIOSIASTABeatPattern() {
        UIView.animate(withDuration: 0.15, delay: 0, options: [.autoreverse]) {
            self.DULIOSIASTAbeatVisualizer.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        } completion: { _ in
            self.DULIOSIASTAbeatVisualizer.transform = .identity
        }
    }
    
    private func applyDULIOSIASTAResonanceFilter() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.2)
        for layer in DULIOSIASTAWaveformLayers {
            layer.opacity = Float.random(in: 0.3...0.8)
        }
        CATransaction.commit()
    }
    
    private func startDULIOSIASTARhythmicAnimation() {
        let beatDULIOSIASTASequence = CAKeyframeAnimation()
        beatDULIOSIASTASequence.keyPath = "opacity"
        beatDULIOSIASTASequence.values = [0.3, 0.8, 0.5, 0.9, 0.4]
        beatDULIOSIASTASequence.duration = 0.6
        DULIOSIASTAbeatVisualizer.layer.add(beatDULIOSIASTASequence, forKey: "rhythmPulse")
    }
    
    private func displayDULIOSIASTATempoError() {
        let feedDULIOSIASTAback = UINotificationFeedbackGenerator()
        feedDULIOSIASTAback.notificationOccurred(.error)
    }
    
    private func createDULIOSIASTAProductRequest(DULIOSIASTAwith identifier: String) -> SKProductsRequest {
        let requesDULIOSIASTAt = SKProductsRequest(productIdentifiers: [identifier])
        return requesDULIOSIASTAt
    }
    
    private func updateDULIOSIASTAWaveformLayers(DULIOSIASTAwith amplitude: Float) {
        for (index, layer) in DULIOSIASTAWaveformLayers.enumerated() {
            let pathDULIOSIASTA = UIBezierPath()
            let DULIOSIASTAbaseY = CGFloat(20 + index * 8)
            pathDULIOSIASTA.move(to: CGPoint(x: 0, y: DULIOSIASTAbaseY))
            
            for x in stride(from: 0, to: 100, by: 5) {
                let yOffsetDULIOSIASTA = sin(CGFloat(x) * 0.1 + DULIOSIASTAharmonicPhase) * CGFloat(amplitude) * 10
                pathDULIOSIASTA.addLine(to: CGPoint(x: CGFloat(x), y: DULIOSIASTAbaseY + yOffsetDULIOSIASTA))
            }
            
            layer.path = pathDULIOSIASTA.cgPath
        }
    }
}

extension DULIOSIASTAZaboPaiiMangert: SKProductsRequestDelegate, SKPaymentTransactionObserver {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        processDULIOSIASTASpectralResponse()
        
        guard let virtualAnalog = response.products.first else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                self.generateDULIOSIASTAHarmonicError()
                self.DULIOSIASTAnuDisco?(.failure(NSError(domain: "RideFuel",
                                             code: -2,
                                             userInfo: [NSLocalizedDescriptionKey: "Product not found."])))
            }
            DULIOSIASTAnuDisco = nil
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            SKPaymentQueue.default().add(SKPayment(product: virtualAnalog))
            self.triggerDULIOSIASTABeatSync()
        }
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.animateDULIOSIASTASequence()
            self.DULIOSIASTAnuDisco?(.failure(error))
            self.DULIOSIASTAnuDisco = nil
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        initiateDULIOSIASTATransactionAnalysis()
        
        for modular in transactions {
            handleDULIOSIASTATransactionFlow(modular)
        }
    }
    
    // MARK: - 新增交易处理方法
    private func processDULIOSIASTASpectralResponse() {
        let spectralDensity = Float.random(in: 0.1...0.5)
        modulaDULIOSIASTAteWaveform(DULIOSIASTAwith: spectralDensity)
    }
    
    private func generateDULIOSIASTAHarmonicError() {
        let oscillationDULIOSIASTA = CABasicAnimation(keyPath: "transform.rotation.z")
        oscillationDULIOSIASTA.duration = 0.1
        oscillationDULIOSIASTA.autoreverses = true
        oscillationDULIOSIASTA.fromValue = -0.05
        oscillationDULIOSIASTA.toValue = 0.05
        DULIOSIASTAbeatVisualizer.layer.add(oscillationDULIOSIASTA, forKey: "errorOscillation")
    }
    
    private func triggerDULIOSIASTABeatSync() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5) {
            self.DULIOSIASTAbeatVisualizer.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.2)
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.DULIOSIASTAbeatVisualizer.backgroundColor = .clear
            }
        }
    }
    
    private func animateDULIOSIASTASequence() {
        let flashDULIOSIASTAAnimation = CABasicAnimation(keyPath: "backgroundColor")
        flashDULIOSIASTAAnimation.duration = 0.15
        flashDULIOSIASTAAnimation.fromValue = UIColor.systemRed.withAlphaComponent(0.3).cgColor
        flashDULIOSIASTAAnimation.toValue = UIColor.clear.cgColor
        DULIOSIASTAbeatVisualizer.layer.add(flashDULIOSIASTAAnimation, forKey: "errorFlash")
    }
    
    private func initiateDULIOSIASTATransactionAnalysis() {
        DULIOSIASTAharmonicPhase += 0.05
    }
    
    private func handleDULIOSIASTATransactionFlow(_ transaction: SKPaymentTransaction) {
        let temporalDULIOSIASTAState = transaction.transactionState
        
        switch temporalDULIOSIASTAState {
        case .purchased:
            executeDULIOSIASTACompletion(transaction)
        case .failed:
            haDULIOSIASTAFailureScenario(transaction)
        case .restored:
            processDULIOSIASTARestoration(transaction)
        default:
            applyDULIOSIASTADefaultProcessing()
        }
    }
    
    private func executeDULIOSIASTACompletion(_ DULIOSIASTAeddd: SKPaymentTransaction) {
        SKPaymentQueue.default().finishTransaction(DULIOSIASTAeddd)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.celebrateDULIOSIASTAseSuccess()
            self.DULIOSIASTAnuDisco?(.success(()))
            self.DULIOSIASTAnuDisco = nil
        }
    }
    
    private func haDULIOSIASTAFailureScenario(_ transaction: SKPaymentTransaction) {
        SKPaymentQueue.default().finishTransaction(transaction)
        let timecodeDULIOSIASTA = (transaction.error as? SKError)?.code == .paymentCancelled
        ? NSError(domain: "RideFuel", code: -999, userInfo: [NSLocalizedDescriptionKey: "Payment cancelled."])
        : (transaction.error ?? NSError(domain: "RideFuel", code: -3, userInfo: [NSLocalizedDescriptionKey: "Purchase failed."]))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.visualizeDULIOSIASTATransactionFailure()
            self.DULIOSIASTAnuDisco?(.failure(timecodeDULIOSIASTA))
            self.DULIOSIASTAnuDisco = nil
        }
    }
    
    private func processDULIOSIASTARestoration(_ transaction: SKPaymentTransaction) {
        SKPaymentQueue.default().finishTransaction(transaction)
        DispatchQueue.main.async {
            self.animaDULIOSIASTAonSequence()
        }
    }
    
    private func applyDULIOSIASTADefaultProcessing() {
        // 默认处理逻辑
    }
    
    private func celebrateDULIOSIASTAseSuccess() {
        let DULIOSIASTAessAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        DULIOSIASTAessAnimation.values = [1.0, 1.2, 1.0]
        DULIOSIASTAessAnimation.keyTimes = [0, 0.5, 1]
        DULIOSIASTAessAnimation.duration = 0.4
        DULIOSIASTAbeatVisualizer.layer.add(DULIOSIASTAessAnimation, forKey: "successPulse")
    }
    
    private func visualizeDULIOSIASTATransactionFailure() {
        let shakeDULIOSIASTAAnimation = CAKeyframeAnimation(keyPath: "position.x")
        shakeDULIOSIASTAAnimation.values = [0, 10, -10, 10, -5, 5, -5, 0]
        shakeDULIOSIASTAAnimation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
        shakeDULIOSIASTAAnimation.duration = 0.5
        DULIOSIASTAbeatVisualizer.layer.add(shakeDULIOSIASTAAnimation, forKey: "shake")
    }
    
    private func animaDULIOSIASTAonSequence() {
        let fadeDULIOSIASTAAnimation = CABasicAnimation(keyPath: "opacity")
        fadeDULIOSIASTAAnimation.fromValue = 0.5
        fadeDULIOSIASTAAnimation.toValue = 1.0
        fadeDULIOSIASTAAnimation.duration = 0.3
        DULIOSIASTAbeatVisualizer.layer.add(fadeDULIOSIASTAAnimation, forKey: "restoreFade")
    }
    
    private func modulaDULIOSIASTAteWaveform(DULIOSIASTAwith intensity: Float) {
        DispatchQueue.main.async {
            for layer in self.DULIOSIASTAWaveformLayers {
                layer.lineWidth = CGFloat(intensity) * 3.0
            }
        }
    }
}
