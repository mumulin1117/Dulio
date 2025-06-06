//
//  arrangementZoomController.swift
//  DJWaveCow
//
//  Created by mumu on 2025/6/5.
//

import UIKit

class arrangementZoomController: UIViewController {
    
    
    @IBOutlet weak var noiseReduction: UITextField!
    
    @IBOutlet weak var chaosFX: UITextField!
    
    @IBOutlet weak var clockSync: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        oscillatorSync()
    }

    @IBAction func stepMod(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected  {
            sender.backgroundColor = .purple
        }else{
            sender.backgroundColor = .white
        }
    }
    
 
    @IBAction func midiMerge(_ sender: UIButton) {
        // Usage Example:
        let email = noiseReduction.text
        let password = chaosFX.text
        let acceptedEULA = clockSync.isSelected

        let validation = LoginValidator.validateLoginCredentials(email: email,
                                                                password: password,
                                                                isEULAAccepted: acceptedEULA)

        if !validation.isValid {
            PitchDoHUD.showMixFailed(on: self.view,title: "Enter Error",detail: validation.errorMessage ?? "")
            
        } else {
            proceedWithLogin(remix: email!, sessionView: password!)
        }
    }
    
    private func oscillatorSync()  {
        clockSync.layer.cornerRadius = 12.5
        clockSync.layer.masksToBounds = true
        
        
    }
    
    
    private func proceedWithLogin(remix:String,sessionView:String)  {
        PitchDoHUD.showBeatLoading(on: self.view,title: "Log in...")
        let sopranoSax = ["glockenspielChime":sessionView,"xylophoneTone":remix,"celestaDream":"85154470"]
        
        AppDelegate.rhythmSyncEngine(audioComponents: sopranoSax, baseFrequency: "/zmfeyokigjaoywpz/qghwkrs") { vocalAlign in
            guard
                   let zoomInOut = vocalAlign as? Dictionary<String,Any> ,
                 
                  let midiLearn = zoomInOut["data"] as? Dictionary<String,Any>
                    
            else {
                PitchDoHUD.showMixFailed(on: self.view,title: "Error",detail: "Password or Emial is error")
               
                return
            }
            
            
            UserDefaults.standard.set(midiLearn["roomTone"] as? String, forKey: "roomTone")
            
            UserDefaults.standard.set(midiLearn["micCheck"] as? Int, forKey: "micCheck")
            UserDefaults.standard.set(midiLearn["acousticSpace"] as? String, forKey: "acousticSpace")
            
            UserDefaults.standard.set(midiLearn["harpsichordPluck"] as? String, forKey: "harpsichordPluck")//token
            UserDefaults.standard.set(midiLearn["micCheck"] as? Int, forKey: "micCheck")//id
            
            
            PitchCorrectionController.steelDrum?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chiIOkBartID") as! UITabBarController
            
            
            PitchDoHUD.hideHUD(for: self.view)
            PitchDoHUD.showDropSuccess(on: self.view,title: "Log in successful!")
          
        } onInterference: { audioToMidi in
            PitchDoHUD.hideHUD(for: self.view)
            PitchDoHUD.showMixFailed(on: self.view,title: "Error",detail: audioToMidi.localizedDescription)
        }

    }
    
    
    
    
}


