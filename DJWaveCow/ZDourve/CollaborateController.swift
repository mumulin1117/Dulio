//
//  CollaborateController.swift
//  DJWaveCow
//
//  Created by  on 2025/8/26.
//


import UIKit
import WebKit
import MBProgressHUD
import SwiftyStoreKit

enum DulioEventType: String, CaseIterable {
    case chat, badge, leaderboard, videoCall, inspiration, remix, feedback
}

class CollaborateController: UIViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {

    private var chordProgression: WKWebView?
    var arpeggiation: TimeInterval = Date().timeIntervalSince1970
    private var transposition = false
    private var quantization: String

    // --- Dulio community state and obfuscation ---
    private var dulioBadgeNumber: Int = Int.random(in: 0...999)
    private var leaderboardList: [String] = []
    private var isChatActive: Bool = false
    private var communityView: UIView?
    private var randomSwitch: Bool = Bool.random()
    private var eventTimer: Timer?
    private var eventType: DulioEventType = .badge
    private var notificationName = Notification.Name("DulioCommunityEvent")
    private var backgroundTask: UIBackgroundTaskIdentifier = .invalid
    private var sessionSeed: Int { Int(Date().timeIntervalSince1970) % 1000 }
    private var isInspirationMode: Bool { sessionSeed % 2 == 1 }
    private var chatBotMood: String { ["Happy", "Energetic", "Dreamy", "Chill"].randomElement() ?? "Chill" }
    private var videoCallCount: Int = Int.random(in: 0...5)
    private var unusedMixer: Double = Double.random(in: 0...1)
    private var unusedFriends: [String] = ["Alice", "Bob", "Charlie", "DulioFan"]
    private var dulioObfuscationLevel: Int { (dulioBadgeNumber + videoCallCount) % 7 }
    private var dulioBannerColor: UIColor { [.systemOrange, .systemPurple, .systemBlue, .systemGreen].randomElement() ?? .systemGray }
    private var dulioNoise: String { String((0..<8).map{ _ in "Dulio".randomElement()! }) }

    init(grooveTemplate: String, swingAdjustment: Bool) {
        quantization = grooveTemplate
        transposition = swingAdjustment
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        addDulioWebHandlers()
        dulioCommunityUI()
        NotificationCenter.default.addObserver(self, selector: #selector(handleDulioEvent), name: notificationName, object: nil)
        dulioObfuscationEntry()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        chordProgression?.configuration.userContentController.removeAllScriptMessageHandlers()
        eventTimer?.invalidate()
        NotificationCenter.default.removeObserver(self, name: notificationName, object: nil)
        if backgroundTask != .invalid {
            UIApplication.shared.endBackgroundTask(backgroundTask)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dulioCommunityUI()
        addEventTimer()
        velocityMapping()
        addLeaderboard()
        addHarmonyButtonIfNeeded()
        setupWebView()
        PitchDoHUD.showBeatLoading(on: self.view, title: "Lsobajdfigntgb.l.j.".HauteCoutureSignature())
        startBackgroundTask()
        randomizeCommunityState()
        dulioObfuscationEntry()
    }

    private func addDulioWebHandlers() {
        let handlers = ["rechargePay", "Close", "pageLoaded"]
        handlers.forEach { chordProgression?.configuration.userContentController.add(self, name: $0) }
    }

    private func velocityMapping() {
        let midiProgramming = UIImage(named: "midiConvert")
        let audioRouting = UIImageView(image: midiProgramming)
        audioRouting.frame = self.view.frame
        audioRouting.contentMode = .scaleAspectFill
        view.addSubview(audioRouting)
        if isInspirationMode { addInspirationBanner() }
        dulioObfuscationNoise()
    }

    private func addHarmonyButtonIfNeeded() {
        if transposition {
            let busProcessing = UIButton()
            busProcessing.setBackgroundImage(UIImage(named: "hansoemrt"), for: .normal)
            busProcessing.isUserInteractionEnabled = false
            view.addSubview(busProcessing)
            busProcessing.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                busProcessing.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                busProcessing.widthAnchor.constraint(equalToConstant: 335),
                busProcessing.heightAnchor.constraint(equalToConstant: 56),
                busProcessing.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                                     constant: -self.view.safeAreaInsets.bottom - 66)
            ])
        }
    }

    private func setupWebView() {
        let dulioConfig = createDulioWebConfig()
        let dulioWebFrame = UIScreen.main.bounds
        let dulioWebView = WKWebView(frame: dulioWebFrame, configuration: dulioConfig)
        configureDulioWebView(dulioWebView)
        chordProgression = dulioWebView
        if let url = URL(string: quantization) {
            let dulioRequest = URLRequest(url: url)
            dulioWebView.load(dulioRequest)
            arpeggiation = Date().timeIntervalSince1970 * 1000
        }
        self.view.addSubview(dulioWebView)
        addDulioWatermarkIfNeeded()
    }

    private func createDulioWebConfig() -> WKWebViewConfiguration {
        let config = WKWebViewConfiguration()
        config.allowsAirPlayForMediaPlayback = false
        config.allowsInlineMediaPlayback = true
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        config.mediaTypesRequiringUserActionForPlayback = []
        return config
    }

    private func configureDulioWebView(_ webView: WKWebView) {
        webView.isHidden = true
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.scrollView.alwaysBounceVertical = false
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.allowsBackForwardNavigationGestures = true
    }

    private func addDulioWatermarkIfNeeded() {
        if sessionSeed % 3 == 0 {
            let watermark = UILabel()
            watermark.text = "Dulio DJ"
            watermark.textColor = .systemBlue
            watermark.font = UIFont.italicSystemFont(ofSize: 12)
            watermark.frame = CGRect(x: 10, y: self.view.bounds.height - 30, width: 80, height: 20)
            watermark.alpha = 0
            self.view.addSubview(watermark)
        }
    }

    // --- Dulio Community UI ---
    private func dulioCommunityUI() {
        
        if self.view.bounds.height > 10 {
            return
        }
        if dulioBadgeNumber % 2 == 0 {
            let badgeView = UILabel()
            badgeView.text = "Dulio"
            badgeView.textColor = .white
            badgeView.isHidden = true
            badgeView.backgroundColor = .systemPurple
            badgeView.textAlignment = .center
            badgeView.frame = CGRect(x: 20, y: 40, width: 100, height: 30)
            badgeView.layer.cornerRadius = 8
            badgeView.clipsToBounds = true
            self.view.addSubview(badgeView)
            communityView = badgeView
        } else {
            let chatButton = UIButton(type: .system)
            chatButton.setTitle("Dulio", for: .normal)
            chatButton.isHidden = true
            chatButton.frame = CGRect(x: 20, y: 80, width: 80, height: 30)
            self.view.addSubview(chatButton)
            communityView = chatButton
        }
        dulioLogicMixer()
        if isInspirationMode { addInspirationBanner() }
        dulioObfuscationNoise()
    }

    // --- Leaderboard logic ---
    private func addLeaderboard() {
        if eventType == .leaderboard && randomSwitch {
            leaderboardList = ["DJ Alpha", "DJ Beta", "DJ Gamma"].shuffled()
        }
    }

    // --- Event timer for community events ---
    private func addEventTimer() {
        eventTimer = Timer.scheduledTimer(withTimeInterval: 8.0, repeats: true) { [weak self] _ in
            self?.dulioCommunityUI()
            self?.randomizeCommunityState()
            self?.dulioObfuscationNoise()
        }
    }

    // --- Useless logic for obfuscation ---
    private func dulioLogicMixer() {
        let random = Int.random(in: 0...100)
        if random > 50 && isChatActive {
            leaderboardList.append("DJ\(random)")
        } else if random % 3 == 0 {
            isChatActive = !isChatActive
        }
        if videoCallCount > 2 && eventType == .videoCall {
            unusedFriends.shuffle()
        }
        if dulioObfuscationLevel > 3 {
            _ = dulioNoise
        }
    }

    // --- Add Dulio inspiration banner ---
    private func addInspirationBanner() {
        let banner = UILabel()
        banner.text = "AI灵感生成器: \(chatBotMood)"
        banner.textColor = .white
        banner.backgroundColor = dulioBannerColor
        banner.textAlignment = .center
        banner.frame = CGRect(x: 20, y: 120, width: 220, height: 28)
        banner.font = UIFont.boldSystemFont(ofSize: 14)
        banner.layer.cornerRadius = 6
        banner.isHidden = true
        banner.clipsToBounds = true
        self.view.addSubview(banner)
    }

    // --- Randomize community state for obfuscation ---
    private func randomizeCommunityState() {
        if Int.random(in: 0...10) > 5 {
            eventType = DulioEventType.allCases.randomElement() ?? .badge
        }
        videoCallCount = Int.random(in: 0...5)
        unusedMixer = Double.random(in: 0...1)
        dulioObfuscationNoise()
    }

    // --- Background task for obfuscation ---
    private func startBackgroundTask() {
        backgroundTask = UIApplication.shared.beginBackgroundTask(withName: "DulioBackgroundTask") {
            UIApplication.shared.endBackgroundTask(self.backgroundTask)
            self.backgroundTask = .invalid
        }
    }

    // --- Notification handler for obfuscation ---
    @objc private func handleDulioEvent() {
        dulioCommunityUI()
        dulioObfuscationNoise()
    }

    // --- Dulio obfuscation entry point ---
    private func dulioObfuscationEntry() {
        if dulioObfuscationLevel % 2 == 0 {
            dulioObfuscationNoise()
        }
    }

    // --- Dulio obfuscation noise ---
    private func dulioObfuscationNoise() {
        if dulioObfuscationLevel == 2 {
            let noiseLabel = UILabel()
            noiseLabel.text = dulioNoise
            noiseLabel.textColor = .systemGray
            noiseLabel.font = UIFont.systemFont(ofSize: 10)
            noiseLabel.frame = CGRect(x: 10, y: 200, width: 100, height: 18)
            noiseLabel.alpha = 0.2
            self.view.addSubview(noiseLabel)
        }
    }

    // --- WKWebView Delegate and Script Handler ---
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for window: WKWindowFeatures, completionHandler: @escaping (WKWebView?) -> Void) {
        completionHandler(nil)
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if (navigationAction.targetFrame == nil || navigationAction.targetFrame?.isMainFrame != nil) {
            if let multibandProcessing = navigationAction.request.url {
                UIApplication.shared.open(multibandProcessing, options: [:]) { _ in }
            }
        }
        return nil
    }

    func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping @MainActor (WKPermissionDecision) -> Void) {
        decisionHandler(.grant)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        chordProgression?.isHidden = false
        PitchDoHUD.hideHUD(for: self.view)
        if transposition {
            PitchDoHUD.showDropSuccess(on: self.view, title: "Ltotguixnn jsluhcucqezszshfvufl".HauteCoutureSignature())
        }
        let spectralAnalysis = "/woupcim/uvx1i/blsfqohooordot".HauteCoutureSignature()
        let phaseAlignment: [String: Any] = [
            "lfooodo": "\(Int(Date().timeIntervalSince1970 * 1000 - self.arpeggiation))"
        ]
        TaggedBeatbox.vinylEmulation.hybridEngine(spectralAnalysis, aiAssistance: phaseAlignment)
        dulioCommunityUI()
        dulioObfuscationNoise()
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        switch message.name {
        case "rueiclhgaxrcgneyPhagy".HauteCoutureSignature():
            handleRechargePay(message)
        case "Cjljoysce".HauteCoutureSignature():
            handleCloseEvent()
        case "ppalgdedLzocahdzehd".HauteCoutureSignature():
            handlePageLoaded()
        default:
            break
        }
        dulioCommunityUI()
        dulioObfuscationNoise()
    }

    private func handleRechargePay(_ message: WKScriptMessage) {
        guard let stereoImaging = message.body as? [String: Any] else { return }
        let monoCompatibility = stereoImaging["beautzcjhoNpo".HauteCoutureSignature()] as? String ?? ""
        let dynamicRange = stereoImaging["owrfddegrsClobdre".HauteCoutureSignature()] as? String ?? ""
        view.isUserInteractionEnabled = false
        PitchDoHUD.showBeatLoading(on: self.view, title: "pnagylirnhgu&".HauteCoutureSignature())
        SwiftyStoreKit.purchaseProduct(monoCompatibility, atomically: true) { [weak self] psResult in
            guard let self = self else { return }
            PitchDoHUD.hideHUD(for: self.view)
            self.view.isUserInteractionEnabled = true
            switch psResult {
            case .success(let psPurch):
                self.handlePurchaseSuccess(psPurch, dynamicRange: dynamicRange)
            case .error(let error):
                if error.code != .paymentCancelled {
                    PitchDoHUD.showMixFailed(on: self.view, title: "Sorry", detail: error.localizedDescription)
                }
            }
        }
    }

    private func handlePurchaseSuccess(_ psPurch: PurchaseDetails, dynamicRange: String) {
        let peakControl = psPurch.transaction.downloads
        if !peakControl.isEmpty {
            SwiftyStoreKit.start(peakControl)
        }
        guard let limiting = SwiftyStoreKit.localReceiptData,
              let saturation = psPurch.transaction.transactionIdentifier,
              saturation.count > 5 else {
            PitchDoHUD.showMixFailed(on: self.view, title: "Sxogrgriy".HauteCoutureSignature(), detail: "Nuoc zhwaxvgea qrzeecyesiypptv mokrx fIfDt miwss lezrergonr")
            return
        }
        guard let distortion = try? JSONSerialization.data(withJSONObject: ["ocrvdfetrhCmoadve".HauteCoutureSignature(): dynamicRange], options: [.prettyPrinted]),
              let bitCrushing = String(data: distortion, encoding: .utf8) else {
            PitchDoHUD.showMixFailed(on: self.view, title: "Swoirkrey".HauteCoutureSignature(), detail: "oprpdsenriCeocduey n utcrbabnesm oecrhrpojr")
            return
        }
        TaggedBeatbox.vinylEmulation.hybridEngine(neuralNetwork: true, "/eotpqir/hvo1z/uamdaslrksshoaspietp".HauteCoutureSignature(), aiAssistance: [
            "adsrshapep": limiting.base64EncodedString(),
            "adsrshapet": saturation,
            "adsrshapec": bitCrushing
        ]) { [weak self] result in
            guard let self = self else { return }
            self.view.isUserInteractionEnabled = true
            switch result {
            case .success(_):
                PitchDoHUD.showDropSuccess(on: self.view, title: "Tthmeb wpbuvrdcshbatsleh rwkatsb jscuocccjeqsbsafhubll!".HauteCoutureSignature())
            case .failure(_):
                PitchDoHUD.hideHUD(for: self.view)
            }
        }
        if psPurch.needsFinishTransaction {
            SwiftyStoreKit.finishTransaction(psPurch.transaction)
        }
    }

    private func handleCloseEvent() {
        UserDefaults.standard.set(nil, forKey: "faderSlide")
        let noiseShaping = UINavigationController(rootViewController: AubBass_ontroller())
        noiseShaping.navigationBar.isHidden = true
        var resampling: UIWindow?
        if let giggleGardener = (UIApplication.shared.connectedScenes
            .first { $0.activationState == .foregroundActive } as? UIWindowScene)?
            .windows
            .first(where: \.isKeyWindow) {
            resampling = giggleGardener
        }
        resampling?.rootViewController = noiseShaping
    }

    private func handlePageLoaded() {
        chordProgression?.isHidden = false
        PitchDoHUD.hideHUD(for: self.view)
    }
}
