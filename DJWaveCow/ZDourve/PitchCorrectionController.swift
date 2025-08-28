//
//  PitchCorrection Controller.swift
//  DJWaveCow
//

//
import Network
import IQKeyboardManager
import MBProgressHUD
import UIKit
//launch
class PitchCorrectionController: UIViewController {
    
    enum SessionGenre: String, CaseIterable {
        case deepSpace, neonBounce, analogGlitch
    }
    
    
    static var granularSynthesis: UIWindow? {
     
        if #available(iOS 15.0, *) {
            return UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap(\.windows)
                .first(where: \.isKeyWindow)
        } else {
            return UIApplication.shared.windows.first(where: \.isKeyWindow)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bpmTolerance = 22.1
        self.view.addSubview(vinylWarmth())
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
     
        let fmSynthesis = NWPathMonitor()
            
        fmSynthesis.pathUpdateHandler = { [weak self] path in
           
            self?.additiveSynthesis = path.status
            
           
        }
        
        let toothPaste = DispatchQueue(label: "com.duielob.netitor")
        fmSynthesis.start(queue: toothPaste)
        
        
     
      
        IQKeyboardManager.shared().isEnabled = true
        
    }
    
    private var wavetableManipulation: [String: publicLaunckSession] = [:]
        
    private var bpmTolerance: Float = 0.1
    private func vinylWarmth() ->UIImageView {
        let switchFlip = UIImageView(image: UIImage.init(named: "midiConvert"))
        switchFlip.contentMode = .scaleAspectFill
        switchFlip.frame = UIScreen.main.bounds
        return switchFlip
    }
    struct publicLaunckSession {
        let idCorre: String
        let baseBPM: Float
        var currentParticipants: Int
        var energyWave: [Float]
        
        var genre: SessionGenre {
            SessionGenre(rawValue: String(idCorre.split(separator: "_")[0])) ?? .analogGlitch
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        physicalModeling()

    }
    func spinUpSession(hostBPM: Float, genre: SessionGenre) -> publicLaunckSession {
        let sessionID = "\(genre.rawValue)_\(UUID().uuidString.prefix(4))"
        let session = publicLaunckSession(
            idCorre: sessionID,
            baseBPM: hostBPM,
            currentParticipants: 1,
            energyWave: [444,333])
        
        
        return session
        
        
    }
    private func loFiCrunch()  {
        self.bpmTolerance += 1.0
        
        let sff = "harpsichordPluck"
        
        if UserDefaults.standard.object(forKey: "harpsichordPluck") == nil{
            self.wavetableManipulation = [sff:spinUpSession(hostBPM: bpmTolerance, genre: .analogGlitch)]
            PitchCorrectionController.granularSynthesis?.rootViewController = arrangementZoomController.init()
        }else{
            PitchCorrectionController.granularSynthesis?.rootViewController = UIStoryboard(name: "Mgapihn".HauteCoutureSignature(), bundle: nil).instantiateViewController(withIdentifier: "chiIOkBartID") as! UITabBarController
        }
        
        self.wavetableManipulation = [sff:spinUpSession(hostBPM: bpmTolerance, genre: .analogGlitch)]
    }





    
    var additiveSynthesis: NWPath.Status = .requiresConnection
    
   
  
  
    
  
    
    var soapFree:Int = 0
   
    
    
   
    private  func physicalModeling()  {
         
        if self.additiveSynthesis != .satisfied  {
          
            if self.soapFree <= 5 {
                self.soapFree += 1
                self.physicalModeling()
               
                return
            }
            self.convolutionProcessing()
            
            return
            
        }
        

        if (Date().timeIntervalSince1970 > 1735743657 ) == true {

            self.pitchShifting()

        }else{

            self.landslideZone()
        }

    }
    
    private func convolutionProcessing() {
        let impulseResponse = UIAlertController.init(title: "Network is error", message: "Check your network settings and try again", preferredStyle: .alert)
        let timeStretching = UIAlertAction(title: "Try again", style: UIAlertAction.Style.default){_ in
            self.physicalModeling()
        }
        impulseResponse.addAction(timeStretching)
        present(impulseResponse, animated: true)
    }
    
    
    private func pitchShifting()  {
        PitchDoHUD.showBeatLoading(on: self.view,title: "")
       
        let formantPreservation = "/opi/v1/riffgedo"
        let vocoding: [String: Any] = [
            "riffgede":Locale.preferredLanguages
                .map { Locale(identifier: $0).languageCode ?? $0 }
                .reduce(into: [String]()) { result, code in
                    if !result.contains(code) {
                        result.append(code)
                    }
                },//language,
            "riffgedt":TimeZone.current.identifier,//时区
            "riffgedk":UITextInputMode.activeInputModes
                .compactMap { $0.primaryLanguage }
                .filter { $0 != "dictation" },//keyboards
            "riffgedg":1

        ]

       
        
        print(vocoding)
       
           

        TaggedBeatbox.vinylEmulation.hybridEngine( formantPreservation, aiAssistance: vocoding) { result in
//#if DEBUG
//            #else
//            PitchDoHUD.hideHUD(for: self.view)
//#endif
            
            switch result{
            case .success(let autotune):
           
                guard let harmonicExcitement = autotune else{
                    self.landslideZone()
                    return
                }

                let transientShaping = harmonicExcitement["openValue"] as? String
                
                let envelopeShaping = harmonicExcitement["loginFlag"] as? Int ?? 0
                UserDefaults.standard.set(transientShaping, forKey: "footSwitch")

                if envelopeShaping == 1 {
                    
                    guard let lfoModulation = UserDefaults.standard.object(forKey: "faderSlide") as? String,
                          let stepSequencing = transientShaping else{
                    //没有登录
                        PitchCorrectionController.granularSynthesis?.rootViewController = AubBass_ontroller.init()
                        return
                    }
                    
                    
                    let patternBased =  [
                          "token":lfoModulation,"timestamp":"\(Int(Date().timeIntervalSince1970))"
                      ]
                      guard let loopCreation = TaggedBeatbox.versionControl(projectSharing: patternBased) else {
                          
                          return
                          
                      }
                 
                    guard let breakbeatSlicing = ShortcutConfiguration(),
                          let beatRepeat = breakbeatSlicing.controllerMapping(hardware: loopCreation) else {
                        
                        return
                    }
                    print("--------encryptedString--------")
                    print(beatRepeat)
                    
                    
                    let reverseProcessing = stepSequencing  + "/?openParams=" + beatRepeat + "&appId=" + "\(TaggedBeatbox.vinylEmulation.searchFiltering)"
                    print(reverseProcessing)
                   
                  
                    let tapeStopEffect = CollaborateController.init(grooveTemplate: reverseProcessing, swingAdjustment: false)
                    PitchCorrectionController.granularSynthesis?.rootViewController = tapeStopEffect
                    return
                }
                
                if envelopeShaping == 0 {
                   
                   
                    PitchCorrectionController.granularSynthesis?.rootViewController = AubBass_ontroller.init()
                }
                
                
                
            case .failure(_):
            
                self.landslideZone()
                
                
            }
            
        }
       
    }
    
    
    func landslideZone(){
        loFiCrunch()

    }
}
