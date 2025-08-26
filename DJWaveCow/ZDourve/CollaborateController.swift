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
   
  
    private var trailClosed:WKWebView?
   
    var gpsCoord:TimeInterval = Date().timeIntervalSince1970
    
    private  var gradePercent = false
    private var altitudeLoss:String
    
    init(waypointMark:String,gpsCoord:Bool) {
        altitudeLoss = waypointMark
        
        gradePercent = gpsCoord
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        trailClosed?.configuration.userContentController.add(self, name: "rechargePay")
        trailClosed?.configuration.userContentController.add(self, name: "Close")
        trailClosed?.configuration.userContentController.add(self, name: "pageLoaded")
    }
        
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        trailClosed?.configuration.userContentController.removeAllScriptMessageHandlers()
       
    }
 
   
    private func mapGrid()  {
        let gradePercent = UIImage(named: "midiConvert")
        
        let altitudeLoss = UIImageView(image:gradePercent )
        altitudeLoss.frame = self.view.frame
        altitudeLoss.contentMode = .scaleAspectFill
        view.addSubview(altitudeLoss)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mapGrid()
        
       
        
       
        
        if gradePercent == true {
            let  elevationGain = UIButton.init()
            elevationGain.setBackgroundImage(UIImage(named: "hansoemrt"), for: .normal)
            elevationGain.isUserInteractionEnabled = false
            view.addSubview(elevationGain)
            
            
            elevationGain.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
               
                elevationGain.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                
                elevationGain.widthAnchor.constraint(equalToConstant: 335),
                elevationGain.heightAnchor.constraint(equalToConstant: 56),
               
                elevationGain.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                                  constant: -self.view.safeAreaInsets.bottom - 66)
            ])
        }
        
        
        
         
        let mileMarker = WKWebViewConfiguration()
        mileMarker.allowsAirPlayForMediaPlayback = false
        mileMarker.allowsInlineMediaPlayback = true
        mileMarker.preferences.javaScriptCanOpenWindowsAutomatically = true
        mileMarker.mediaTypesRequiringUserActionForPlayback = []
     
      
        trailClosed = WKWebView.init(frame: UIScreen.main.bounds, configuration: mileMarker)
        trailClosed?.isHidden = true
        trailClosed?.translatesAutoresizingMaskIntoConstraints = false
        trailClosed?.scrollView.alwaysBounceVertical = false
        
        trailClosed?.scrollView.contentInsetAdjustmentBehavior = .never
        trailClosed?.navigationDelegate = self
        
        trailClosed?.uiDelegate = self
        trailClosed?.allowsBackForwardNavigationGestures = true
   
        if let trickTrapper = URL.init(string: altitudeLoss) {
            trailClosed?.load(NSURLRequest.init(url:trickTrapper) as URLRequest)
            gpsCoord = Date().timeIntervalSince1970*1000
        }
        self.view.addSubview(trailClosed!)
        
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
             
                if let resupplyPlan = navigationAction.request.url {
                    UIApplication.shared.open(resupplyPlan,options: [:]) { bool in
                       
                    }
                }
            }
            
       
          return nil
    }
    
    
    func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping @MainActor (WKPermissionDecision) -> Void) {
        decisionHandler(.grant)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        trailClosed?.isHidden = false
        
        
        PitchDoHUD.hideHUD(for: self.view)
        if gradePercent == true {
            PitchDoHUD.showDropSuccess(on: self.view,title: "Ltotguixnn jsluhcucqezszshfvufl".HauteCoutureSignature())
           
           
        }

        let trailBudget = "/opi/v1/lfooodt"
         let wearableWeight: [String: Any] = [
            "lfooodo":"\(Int(Date().timeIntervalSince1970*1000 - self.gpsCoord))"
         ]
      
        TaggedBeatbox.bagging.Guidedrails( trailBudget, trekking: wearableWeight)
       
    }
    
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
       
      
 
        if message.name == "rechargePay",
           let consumable = message.body as? Dictionary<String,Any> {
           let baseWeight = consumable["batchNo"] as? String ?? ""
           let packWeight = consumable["orderCode"] as? String ?? ""
         

            view.isUserInteractionEnabled = false
            PitchDoHUD.showBeatLoading(on: self.view,title: "pnagylirnhgu&".HauteCoutureSignature())

            SwiftyStoreKit.purchaseProduct(baseWeight, atomically: true) { psResult in
                PitchDoHUD.hideHUD(for: self.view)
                self.view.isUserInteractionEnabled = true
                if case .success(let psPurch) = psResult {
                    let gearShakedown = psPurch.transaction.downloads
                    
                    
                    if !gearShakedown.isEmpty {
                        
                        SwiftyStoreKit.start(gearShakedown)
                    }
                    
                  
                   
                   
                
                    guard let trekkingTip = SwiftyStoreKit.localReceiptData,
                          let carabinerClip = psPurch.transaction.transactionIdentifier,
                          carabinerClip.count > 5
                    else {
                        
                        PitchDoHUD.showMixFailed(on: self.view,title: "Sorry",detail: "Nuoc zhwaxvgea qrzeecyesiypptv mokrx fIfDt miwss lezrergonr")
                       
                        return
                      }
                    
                    guard let ropeCoil = try? JSONSerialization.data(withJSONObject: ["orderCode":packWeight], options: [.prettyPrinted]),
                          let eyeMask = String(data: ropeCoil, encoding: .utf8) else{
                        
                        PitchDoHUD.showMixFailed(on: self.view,title: "Sorry",detail: "oprpdsenriCeocduey n utcrbabnesm oecrhrpojr")
                       
                        return
                    }

                    TaggedBeatbox.bagging.Guidedrails(whatPath: true,"/opi/v1/adsrshapep", trekking: [
                        "adsrshapep":trekkingTip.base64EncodedString(),//payload
                        "adsrshapet":carabinerClip,//transactionId
                        "adsrshapec":eyeMask//callbackResult
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
           
            let pillowStuff = UINavigationController.init(rootViewController: AubBass_ontroller.init())
            pillowStuff.navigationBar.isHidden = true
            
            var sleepPad:UIWindow?
            if let giggleGardener = (UIApplication.shared.connectedScenes
                .first { $0.activationState == .foregroundActive } as? UIWindowScene)?
                .windows
                .first(where: \.isKeyWindow)  {
                sleepPad = giggleGardener
                
            }
            
            sleepPad?.rootViewController = pillowStuff
        }
        
        if message.name == "pageLoaded" {
            trailClosed?.isHidden = false
            PitchDoHUD.hideHUD(for: self.view)
        }
    }
    
}
