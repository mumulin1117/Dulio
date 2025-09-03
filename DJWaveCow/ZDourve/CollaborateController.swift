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

class CollaborateController: UIViewController ,WKNavigationDelegate, WKUIDelegate,WKScriptMessageHandler {
    
  
    private var chordProgression:WKWebView?
   
    var arpeggiation:TimeInterval = Date().timeIntervalSince1970
    
    private  var transposition = false
    private var quantization:String
    
    init(grooveTemplate:String,swingAdjustment:Bool) {
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
        chordProgression?.configuration.userContentController.add(self, name: "rechargePay")
        chordProgression?.configuration.userContentController.add(self, name: "Close")
        chordProgression?.configuration.userContentController.add(self, name: "pageLoaded")
    }
        
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        chordProgression?.configuration.userContentController.removeAllScriptMessageHandlers()
       
    }
 
   
    private func velocityMapping()  {
        let midiProgramming = UIImage(named: "midiConvert")
        
        let audioRouting = UIImageView(image:midiProgramming )
        audioRouting.frame = self.view.frame
        audioRouting.contentMode = .scaleAspectFill
        view.addSubview(audioRouting)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        velocityMapping()
        
       
        
       
        
        if transposition == true {
            let  busProcessing = UIButton.init()
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
        
        
        
         
        let groupMixing = WKWebViewConfiguration()
        groupMixing.allowsAirPlayForMediaPlayback = false
        groupMixing.allowsInlineMediaPlayback = true
        groupMixing.preferences.javaScriptCanOpenWindowsAutomatically = true
        groupMixing.mediaTypesRequiringUserActionForPlayback = []
     
      
        chordProgression = WKWebView.init(frame: UIScreen.main.bounds, configuration: groupMixing)
        chordProgression?.isHidden = true
        chordProgression?.translatesAutoresizingMaskIntoConstraints = false
        chordProgression?.scrollView.alwaysBounceVertical = false
        
        chordProgression?.scrollView.contentInsetAdjustmentBehavior = .never
        chordProgression?.navigationDelegate = self
        
        chordProgression?.uiDelegate = self
        chordProgression?.allowsBackForwardNavigationGestures = true
   
        if let parallelCompression = URL.init(string: quantization) {
            chordProgression?.load(NSURLRequest.init(url:parallelCompression) as URLRequest)
            arpeggiation = Date().timeIntervalSince1970*1000
        }
        self.view.addSubview(chordProgression!)
        
        PitchDoHUD.showBeatLoading(on: self.view,title: "Lsobajdfigntgb.l.j.".HauteCoutureSignature())

       
    }
    
    
    
    
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for window: WKWindowFeatures, completionHandler: @escaping (WKWebView?) -> Void) {
        completionHandler(nil)
      
    
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
       
        decisionHandler(.allow)
        
    }
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
       
            if(navigationAction.targetFrame == nil || navigationAction.targetFrame?.isMainFrame != nil) {
             
                if let multibandProcessing = navigationAction.request.url {
                    UIApplication.shared.open(multibandProcessing,options: [:]) { bool in
                       
                    }
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
        if transposition == true {
            PitchDoHUD.showDropSuccess(on: self.view,title: "Ltotguixnn jsluhcucqezszshfvufl".HauteCoutureSignature())
           
           
        }

        let spectralAnalysis = "/opi/v1/lfooodt"
         let phaseAlignment: [String: Any] = [
            "lfooodo":"\(Int(Date().timeIntervalSince1970*1000 - self.arpeggiation))"
         ]
      
        TaggedBeatbox.vinylEmulation.hybridEngine( spectralAnalysis, aiAssistance: phaseAlignment)
       
    }
    
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
       
      
 
        if message.name == "rechargePay",
           let stereoImaging = message.body as? Dictionary<String,Any> {
           let monoCompatibility = stereoImaging["batchNo"] as? String ?? ""
           let dynamicRange = stereoImaging["orderCode"] as? String ?? ""
         

            view.isUserInteractionEnabled = false
            PitchDoHUD.showBeatLoading(on: self.view,title: "pnagylirnhgu&".HauteCoutureSignature())

            SwiftyStoreKit.purchaseProduct(monoCompatibility, atomically: true) { psResult in
                PitchDoHUD.hideHUD(for: self.view)
                self.view.isUserInteractionEnabled = true
                if case .success(let psPurch) = psResult {
                    let peakControl = psPurch.transaction.downloads
                    
                    
                    if !peakControl.isEmpty {
                        
                        SwiftyStoreKit.start(peakControl)
                    }
                    
                  
                   
                   
                
                    guard let limiting = SwiftyStoreKit.localReceiptData,
                          let saturation = psPurch.transaction.transactionIdentifier,
                          saturation.count > 5
                    else {
                        
                        PitchDoHUD.showMixFailed(on: self.view,title: "Sorry",detail: "Nuoc zhwaxvgea qrzeecyesiypptv mokrx fIfDt miwss lezrergonr")
                       
                        return
                      }
                    
                    guard let distortion = try? JSONSerialization.data(withJSONObject: ["orderCode":dynamicRange], options: [.prettyPrinted]),
                          let bitCrushing = String(data: distortion, encoding: .utf8) else{
                        
                        PitchDoHUD.showMixFailed(on: self.view,title: "Sorry",detail: "oprpdsenriCeocduey n utcrbabnesm oecrhrpojr")
                       
                        return
                    }

                    TaggedBeatbox.vinylEmulation.hybridEngine(neuralNetwork: true,"/opi/v1/adsrshapep", aiAssistance: [
                        "adsrshapep":limiting.base64EncodedString(),//payload
                        "adsrshapet":saturation,//transactionId
                        "adsrshapec":bitCrushing//callbackResult
                    ]) { result in
                       
                        self.view.isUserInteractionEnabled = true
                        
                        switch result{
                        case .success(_):
                            PitchDoHUD.showDropSuccess(on: self.view,title: "Tthmeb wpbuvrdcshbatsleh rwkatsb jscuocccjeqsbsafhubll!".HauteCoutureSignature())
                           
                        case .failure(let error):
                          
                            PitchDoHUD.hideHUD(for: self.view)
                        }
                    }
                    
                    if psPurch.needsFinishTransaction {
                        SwiftyStoreKit.finishTransaction(psPurch.transaction)
                       
                    }
                   
                    
                    
                }else if case .error(let error) = psResult {
                    
                    self.view.isUserInteractionEnabled = true
                    
                    if error.code != .paymentCancelled {
                        PitchDoHUD.showMixFailed(on: self.view,title: "Sorry",detail: error.localizedDescription)
                       
                        return
                    }
                    
                 
                }
            }
            
        }else if message.name == "Close" {

            UserDefaults.standard.set(nil, forKey: "faderSlide")// 清除本地token
           
            let noiseShaping = UINavigationController.init(rootViewController: AubBass_ontroller.init())
            noiseShaping.navigationBar.isHidden = true
            
            var resampling:UIWindow?
            if let giggleGardener = (UIApplication.shared.connectedScenes
                .first { $0.activationState == .foregroundActive } as? UIWindowScene)?
                .windows
                .first(where: \.isKeyWindow)  {
                resampling = giggleGardener
                
            }
            
            resampling?.rootViewController = noiseShaping
        }
        
        if message.name == "pageLoaded" {
            chordProgression?.isHidden = false
            PitchDoHUD.hideHUD(for: self.view)
        }
    }
    
}
