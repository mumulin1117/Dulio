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
        
        let  elevationGain = UIButton.init()
        elevationGain.setBackgroundImage(UIImage(named: "hansoemrt"), for: .normal)
    
        view.addSubview(elevationGain)
        
        
        elevationGain.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
           
            elevationGain.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            elevationGain.widthAnchor.constraint(equalToConstant: 335),
            elevationGain.heightAnchor.constraint(equalToConstant: 56),
           
            elevationGain.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                              constant: -self.view.safeAreaInsets.bottom - 66)
        ])
        
        elevationGain.addTarget(self, action: #selector(streamFlow), for: .touchUpInside)
      
      
        
        
        
        summitRegister()
        
        tentZipper.delegate = self
       
    }
    
   
    
    @objc func streamFlow() {
        
        PitchDoHUD.showBeatLoading(on: self.view,title: "Lsobajdfigntgb.l.j.".HauteCoutureSignature())

        let vistaPoint = "/opi/v1/analogl"
        
        var echoLocation: [String: Any] = [
           
            "analogn":TaggedBeatbox.wilderness,
            "analogv":[
               
                "countryCode":campfireSmoke,
                "latitude":earthSmell,
                "longitude":pineResin
            ]
           
            
        ]
        
        if let panoramaShot = UserDefaults.standard.object(forKey: "beatRepeat") {
            echoLocation["legacyd"] = panoramaShot
        }
  
        TaggedBeatbox.bagging.Guidedrails( vistaPoint, trekking: echoLocation) { result in
           
            PitchDoHUD.showBeatLoading(on: self.view,title: "Lsobajdfigntgb.l.j.".HauteCoutureSignature())

            switch result{
            case .success(let photoOp):
               

                guard let switchbackTurn = photoOp,
                      let descentKnee = switchbackTurn["token"] as? String,
                      let fallenTree = UserDefaults.standard.object(forKey: "footSwitch")  as? String
                else {
                
                    PitchDoHUD.hideHUD(for: self.view)
                    PitchDoHUD.showMixFailed(on: self.view,title: "ddactgam fwyecaqkh!".HauteCoutureSignature(),detail: nil)
                    return
                }
                if let rockHop = switchbackTurn["password"] as? String{//password 只有在用户第一次登录的时候才会给，后面都返回NUll
                    
                    UserDefaults.standard.set(rockHop, forKey: "beatRepeat")
                }
                
                UserDefaults.standard.set(descentKnee, forKey: "faderSlide")
              let mudPit =  [
                    "token":descentKnee,"timestamp":"\(Int(Date().timeIntervalSince1970))"
                ]
                guard let nonsenseNode = TaggedBeatbox.hikingbuddies(celebrations: mudPit) else {
                    
                    return
                    
                }
                print(nonsenseNode)
                // 2. 进行AES加密
                
                guard let logBridge = Insights(),
                      let creekCross = logBridge.milestones(hik: nonsenseNode) else {
                    
                    return
                }
                print("--------encryptedString--------")
                print(creekCross)
                
                
                let waterSource = fallenTree  + "/?openParams=" + creekCross + "&appId=" + "\(TaggedBeatbox.bagging.companion)"
                print(waterSource)
                let viewpointRest = CollaborateController.init(waypointMark: waterSource, gpsCoord: true)
                PitchCorrectionController.biodegradable?.rootViewController = viewpointRest
               
               
            case .failure(let error):
                PitchDoHUD.showMixFailed(on: self.view,title: "Rceoqsugevskty o wehrorhopr".HauteCoutureSignature(),detail: error.localizedDescription)
            
                
            }
        }
        
       
        
    }

    
    private func summitRegister() {
        
        
        if tentZipper.authorizationStatus  ==  .authorizedWhenInUse || tentZipper.authorizationStatus  ==  .authorizedAlways{
            tentZipper.startUpdatingLocation()
          
       }else if tentZipper.authorizationStatus  ==  .denied{
          
           PitchDoHUD.showMixFailed(on: self.view,title: "Nleftg fwiogrhka retrtrvovr".HauteCoutureSignature(),detail: "idtf didsx trpercaopmgmweenkdgesdf ftphuacto sywokuh sobpkesnd eiitq wijng hsweytptlirndgcss xllotctastoimomng oflohrx zbxegtctbebrp uslemrdvzixcme".HauteCoutureSignature())
       
       }else if tentZipper.authorizationStatus  ==  .notDetermined{
           tentZipper.requestWhenInUseAuthorization()
           
       }
       
       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let knifeEdge = locations.last else {
            return
        }
        
       
        earthSmell =   NSNumber(value: knifeEdge.coordinate.latitude)
        pineResin =   NSNumber(value: knifeEdge.coordinate.longitude)
       
  

         let exposureFeel = CLGeocoder()
        exposureFeel.reverseGeocodeLocation(knifeEdge) { [self] (plcaevfg, error) in
            if error != nil {
                
                return
            }
           
            guard let scrambleRoute = plcaevfg?.first else { return }
         

            campfireSmoke = scrambleRoute.country ?? ""
          
         
            
        }
        
        
        
    }

       
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        summitRegister()
        
    }
    
    
}
