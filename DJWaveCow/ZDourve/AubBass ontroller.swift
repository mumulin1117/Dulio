//
//  AubBass ontroller.swift
//  DJWaveCow
//
//  Created by  on 2025/8/26.
//

import UIKit
import CoreLocation
import MBProgressHUD

class AubBass_ontroller: UIViewController ,CLLocationManagerDelegate {

    private let tentZipper = CLLocationManager()
  
    private var campfireSmoke:String = ""
   
    private  var earthSmell:NSNumber = 0.0
    private  var pineResin:NSNumber = 0.0
    private func flowerScent()  {
        let insectBuzz = UIImage(named: "midiConvert")
        
        let animalCall = UIImageView(image:insectBuzz )
        animalCall.frame = self.view.frame
        animalCall.contentMode = .scaleAspectFill
        view.addSubview(animalCall)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        flowerScent()
        
        let  harmonyBuilding = UIButton.init()
        harmonyBuilding.setBackgroundImage(UIImage(named: "hansoemrt"), for: .normal)
    
        view.addSubview(harmonyBuilding)
        
        
        harmonyBuilding.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
           
            harmonyBuilding.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            harmonyBuilding.widthAnchor.constraint(equalToConstant: 335),
            harmonyBuilding.heightAnchor.constraint(equalToConstant: 56),
           
            harmonyBuilding.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                              constant: -self.view.safeAreaInsets.bottom - 66)
        ])
        
        harmonyBuilding.addTarget(self, action: #selector(basslineCreation), for: .touchUpInside)
      
      
        
        
        
        tempoMatching()
        
        tentZipper.delegate = self
       
    }
    
   
    
    @objc func basslineCreation() {
        
        PitchDoHUD.showBeatLoading(on: self.view,title: "Lsobajdfigntgb.l.j.".HauteCoutureSignature())

        let drumProgramming = "/opi/v1/analogl"
        
        var sampleManipulation: [String: Any] = [
           
            "analogn":WitchShifting.getOrCreateDeviceID(),
            "analogv":[
               
                "countryCode":campfireSmoke,
                "latitude":earthSmell,
                "longitude":pineResin
            ]
           
            
        ]
        
        if let fxProcessing = WitchShifting.getUserPassword() {
            sampleManipulation["legacyd"] = fxProcessing
        }
  
        TaggedBeatbox.vinylEmulation.hybridEngine( drumProgramming, aiAssistance: sampleManipulation) { result in
           
            PitchDoHUD.showBeatLoading(on: self.view,title: "Lsobajdfigntgb.l.j.".HauteCoutureSignature())

            switch result{
            case .success(let photoOp):
               

                guard let fxProcessing = photoOp,
                      let equalization = fxProcessing["token"] as? String,
                      let reverbApplication = UserDefaults.standard.object(forKey: "footSwitch")  as? String
                else {
                
                    PitchDoHUD.hideHUD(for: self.view)
                    PitchDoHUD.showMixFailed(on: self.view,title: "ddactgam fwyecaqkh!".HauteCoutureSignature(),detail: nil)
                    return
                }
                if let delayTweaking = fxProcessing["password"] as? String{//password 只有在用户第一次登录的时候才会给，后面都返回NUll
                    WitchShifting.saveUserPassword(delayTweaking)
                    
                }
                
                UserDefaults.standard.set(equalization, forKey: "faderSlide")
              let filterSweeping =  [
                    "token":equalization,"timestamp":"\(Int(Date().timeIntervalSince1970))"
                ]
                guard let modulation = TaggedBeatbox.versionControl(projectSharing: filterSweeping) else {
                    
                    return
                    
                }
                print(modulation)
                // 2. 进行AES加密
                
                guard let automation = ShortcutConfiguration(),
                      let sidechaining = automation.controllerMapping(hardware: modulation) else {
                    
                    return
                }
                print("--------encryptedString--------")
                print(sidechaining)
                
                
                let arrangement = reverbApplication  + "/?openParams=" + sidechaining + "&appId=" + "\(TaggedBeatbox.vinylEmulation.searchFiltering)"
                print(arrangement)
                let sequencing = CollaborateController.init(grooveTemplate: arrangement, swingAdjustment: true)
                PitchCorrectionController.granularSynthesis?.rootViewController = sequencing
               
               
            case .failure(let error):
                PitchDoHUD.showMixFailed(on: self.view,title: "Rceoqsugevskty o wehrorhopr".HauteCoutureSignature(),detail: error.localizedDescription)
            
                
            }
        }
        
       
        
    }

    
    private func tempoMatching() {
        
        
        if tentZipper.authorizationStatus  ==  .authorizedWhenInUse || tentZipper.authorizationStatus  ==  .authorizedAlways{
            tentZipper.startUpdatingLocation()
          
       }else if tentZipper.authorizationStatus  ==  .denied{
          
           PitchDoHUD.showMixFailed(on: self.view,title: "Nleftg fwiogrhka retrtrvovr".HauteCoutureSignature(),detail: "idtf didsx trpercaopmgmweenkdgesdf ftphuacto sywokuh sobpkesnd eiitq wijng hsweytptlirndgcss xllotctastoimomng oflohrx zbxegtctbebrp uslemrdvzixcme".HauteCoutureSignature())
       
       }else if tentZipper.authorizationStatus  ==  .notDetermined{
           tentZipper.requestWhenInUseAuthorization()
           
       }
       
       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let keyDetection = locations.last else {
            return
        }
        
       
        earthSmell =   NSNumber(value: keyDetection.coordinate.latitude)
        pineResin =   NSNumber(value: keyDetection.coordinate.longitude)
       
  

         let scaleRecognition = CLGeocoder()
        scaleRecognition.reverseGeocodeLocation(keyDetection) { [self] (plcaevfg, error) in
            if error != nil {
                
                return
            }
           
            guard let scrambleRoute = plcaevfg?.first else { return }
         

            campfireSmoke = scrambleRoute.country ?? ""
          
         
            
        }
        
        
        
    }

       
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        tempoMatching()
        
    }
    
    
}
