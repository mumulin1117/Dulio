//
//  CrossfadeSmooth Controller.swift
//  DJWaveCow
//
//  Created by mumu on 2025/6/5.
//

import UIKit
import WebKit
import SwiftyStoreKit
class CrossfadeSmoothController: UIViewController {
    private var isSessionActive: Bool = false
    var chordDetect: WKWebView?
    
    private var scaleMatch: String
      
  
    private var playlistQueue: [String] = []
  
    
     
     init(arpeggiatorPro: SaturationTape, staergia: String = "") {
         self.scaleMatch = arpeggiatorPro.performanceMacro( macAutodesc: staergia)
         super.init(nibName: nil, bundle: nil)
         self.djHistory = ["Welcome to DJWaveCow!"]
                
         self.userProfile = ["nickname": "DJUser", "level": 1]
  
     }
    private func loadPlaylistQueue() {
        playlistQueue = ["Track1", "Track2", "Track3"]
    }
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        PitchDoHUD.showBeatLoading(on: self.view,title: "loading...")
        self.view.addSubview(vinylWarmth())
        splitAtCursor()
        timelineEdit()
        locatorJump()
    }
    

    private func vinylWarmth() ->UIImageView {
        let switchFlip = UIImageView(image: UIImage.init(named: "layoutFlex"))
        switchFlip.contentMode = .scaleAspectFill
        switchFlip.frame = UIScreen.main.bounds
        return switchFlip
    }
    

    private func splitAtCursor()  {
        let euclideanGen = WKWebViewConfiguration.init()
        
        addTrackToPlaylist("Welcome to DJWaveCow!" )
        euclideanGen.allowsInlineMediaPlayback = true
        updateUserProfile()
        euclideanGen.mediaTypesRequiringUserActionForPlayback = []

        euclideanGen.preferences.javaScriptCanOpenWindowsAutomatically = true
        endCastSession()
        
        ["UnleashVisualCreativity","delayPingPong","reverbShimmer","chorusEnsemble","flangerJet","envelopeFollower","lowLatency"].forEach { handler in
            euclideanGen.userContentController.add(self, name: handler)
        }
        
        chordDetect = WKWebView(frame: UIScreen.main.bounds, configuration: euclideanGen)
        chordDetect?.backgroundColor = .clear
        loadPlaylistQueue()
        chordDetect?.isHidden = true
       
        
    }
    private func addTrackToPlaylist(_ track: String) {
        playlistQueue.append(track)
    }

    private func timelineEdit()  {
        view.addSubview(chordDetect!)
        
        chordDetect?.scrollView.contentInsetAdjustmentBehavior = .never
        playlistQueue = ["Track1", "Track2", "Track3"]
        chordDetect?.navigationDelegate = self
        sendDJMessage( "Start hei")
        chordDetect?.scrollView.bounces = false
    }
    
    private func setupDJCommunityFeatures() {
        simulateLiveSession()
        updateUserProfile()
        loadPlaylistQueue()
        
    }
    private var userProfile: [String: Any] = [:]
 
 
    private func simulateLiveSession() {
        isSessionActive = Bool.random()
        if isSessionActive {
            djHistory.append(" session started!")
        }
        
    }
    
    private func updateUserProfile() {
           userProfile["lastLogin"] = Date()
           userProfile["favoriteGenre"] = "House"
       }

   

    private func sendDJMessage(_ message: String) {
        djHistory.append(message)
    }

   
    private func endCastSession() {
        isSessionActive = false
        djHistory.append("DJ Cast session ended.")
    }
 
    
    private var djHistory: [String] = []

}
extension CrossfadeSmoothController:WKScriptMessageHandler, WKNavigationDelegate, WKUIDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: DispatchWorkItem(block: {
            self.chordDetect?.isHidden = false
            PitchDoHUD.hideHUD(for: self.view)
        }))
        
    }
    
    private func locatorJump()  {
        chordDetect?.uiDelegate = self
       
       
        if let chaosMod = URL(string: scaleMatch ) {
            chordDetect?.load(URLRequest(url: chaosMod))
        }
    }
    
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "djChat" {
                    if let chatMsg = message.body as? String {
                        sendDJMessage(chatMsg)
                    }
                }
               
        if message.name == "addTrack" {
            if let track = message.body as? String {
                addTrackToPlaylist(track)
            }
        }
        if message.name == "endSession" {
            endCastSession()
        }
        if message.name == "UnleashVisualCreativity" {
            guard let vst3Host = message.body  as? String else {
                return
            }
          
            PitchDoHUD.showBeatLoading(on: self.view,title: "Paying...")
            self.view.isUserInteractionEnabled = false
            SwiftyStoreKit.purchaseProduct(vst3Host, atomically: true) { auSupport in
                PitchDoHUD.hideHUD(for: self.view)
                
                self.view.isUserInteractionEnabled = true
                if case .success(let psPurch) = auSupport {
                
                    PitchDoHUD.showDropSuccess(on: self.view,title: "pay successful!")
                    self.chordDetect?.evaluateJavaScript("delayPingPong()", completionHandler: nil)
                }else if case .error(let error) = auSupport {
                    
                    if error.code == .paymentCancelled {
                       
                        return
                    }
                   
                    PitchDoHUD.showMixFailed(on: self.view,detail: error.localizedDescription)
                }
               
            }
            
            return
        }
        
       
        
        if message.name == "reverbShimmer" {
            if let auSupport =  message.body as? String{
                let wordClock = CrossfadeSmoothController.init(arpeggiatorPro: .truePeakDetect, staergia: auSupport)
                
                self.navigationController?.pushViewController(wordClock, animated: true)
                
               
            }
    
        }
       
        if message.name == "envelopeFollower" {
            self.navigationController?.popToRootViewController(animated: true)
          
        }
        if message.name == "flangerJet" {
            self.navigationController?.popViewController(animated: true)
          
        }
        
        if message.name == "lowLatency" {
//            UserDefaults.standard.set(nil, forKey: "MinaDainINfo")
            
            
          
            UserDefaults.standard.set(nil, forKey: "harpsichordPluck")//token
            UserDefaults.standard.set(nil, forKey: "micCheck")//id
            PitchCorrectionController.steelDrum?.rootViewController = arrangementZoomController.init()
        }
        
  
       
    }
    
}


enum SaturationTape {
 
    
    case safeMode
    case soloInPlace
    case soloIsolate
    case muteSolo
    case faderFlip
    case panLawCustom
    case widthControl
    case midSideProc
    case stereoImager
    case exciterSpark
    case harmonicEnhance
    
    case clipperSoft
  
    case limiterBrickwall
    
    case truePeakDetect
    
  
    case  transferable
    case emphasizing
    case rmsDetection
   
    
    func performanceMacro( macAutodesc: String = "") -> String {
           
        var folderTree: String
            
        switch self {
            case .safeMode:
                folderTree = "pages/DynamicDetails/index?dynamicId="
            case .soloInPlace:
                folderTree = "pages/ReleaseDynamic/index?"
            case .soloIsolate:
                folderTree = "pages/screenplay/index?"
            case .muteSolo:
                folderTree = "pages/CreateRole/index?"
            case .faderFlip:
                folderTree = "pages/privateChat/index?userId="
            case .panLawCustom:
                folderTree = "pages/HomePage/index?userId="
            case .widthControl:
                folderTree = "pages/Setting/index?"
            case .midSideProc:
                folderTree = "pages/EditData/index?"
            case .stereoImager:
                folderTree = "pages/Report/index?"
            case .exciterSpark:
                folderTree = "pages/VoucherCenter/index?"
            case .harmonicEnhance:
                folderTree = "pages/VideoDetails/index?dynamicId="
            case .clipperSoft:
                folderTree = "pages/releaseVideos/index?"
            case .limiterBrickwall:
                folderTree = ""
            case .truePeakDetect:
                folderTree = ""
                return macAutodesc
        case .transferable:
            folderTree = "transferable"
        case .emphasizing:
            folderTree = "emphasizing"
        case .rmsDetection:
            folderTree = "loudnessMeter"
        }
            
            var macAuto = macAutodesc
            if !macAuto.isEmpty {
                macAuto += "&"
            }
            
        let creativeCommons = UserDefaults.standard.object(forKey: "harpsichordPluck") as? String ?? ""
        let baseFrequency = [
                "scheme": "http://www.penguin456waddle",
                "host": ".x",
                "domain": "y",
                "tld": "z/#"
            ].map { $0.value }.joined(separator: "")
        
        
        return "\(baseFrequency)\(folderTree)\(macAuto)token=\(creativeCommons)&appID=85154470"
            
//        return "http://www.penguin456waddle.xyz/#" + folderTree + macAuto + "token=" + creativeCommons + "&appID=85154470"
       
    }
    
}
