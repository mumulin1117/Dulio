//
//  PitchCorrection Controller.swift
//  DJWaveCow
//
//  Created by mumu on 2025/6/5.
//

import UIKit
//launch
class PitchCorrectionController: UIViewController {
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

        self.view.addSubview(vinylWarmth())
        
    }
    

    private func vinylWarmth() ->UIImageView {
        let switchFlip = UIImageView(image: UIImage.init(named: "midiConvert"))
        switchFlip.contentMode = .scaleAspectFill
        switchFlip.frame = UIScreen.main.bounds
        return switchFlip
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loFiCrunch()
    }
    
    private func loFiCrunch()  {
        if UserDefaults.standard.object(forKey: "harpsichordPluck") == nil{
            PitchCorrectionController.steelDrum?.rootViewController = arrangementZoomController.init()
        }else{
            PitchCorrectionController.steelDrum?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chiIOkBartID") as! UITabBarController
        }
    }

}
