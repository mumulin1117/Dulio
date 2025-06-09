//
//  PitchCorrection Controller.swift
//  DJWaveCow
//

//

import UIKit
//launch
class PitchCorrectionController: UIViewController {
    
    enum SessionGenre: String, CaseIterable {
        case deepSpace, neonBounce, analogGlitch
    }
    
    
    static var steelDrum: UIWindow? {
     
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
        
    }
    
    private var activeSessions: [String: publicLaunckSession] = [:]
        
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
        
        loFiCrunch()
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
            self.activeSessions = [sff:spinUpSession(hostBPM: bpmTolerance, genre: .analogGlitch)]
            PitchCorrectionController.steelDrum?.rootViewController = arrangementZoomController.init()
        }else{
            PitchCorrectionController.steelDrum?.rootViewController = UIStoryboard(name: "Mgapihn".HauteCoutureSignature(), bundle: nil).instantiateViewController(withIdentifier: "chiIOkBartID") as! UITabBarController
        }
        
        self.activeSessions = [sff:spinUpSession(hostBPM: bpmTolerance, genre: .analogGlitch)]
    }

}
