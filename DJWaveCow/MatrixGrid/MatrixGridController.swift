//
//  MatrixGridController.swift
//  DJWaveCow
//

//

import UIKit

class MatrixGridController: UIViewController {
    var patternLock = Array<Dictionary<String,Any>>()
    @IBOutlet weak var sampleAccurate: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        windChime()
        proceedWithLogin()
    }
    private func windChime()  {
        
        
       
        sampleAccurate.dataSource = self
        sampleAccurate.register(UINib(nibName: "MatrixDgridCell", bundle: nil), forCellWithReuseIdentifier: "MatrixDgridCell")
        sampleAccurate.delegate = self
        sampleAccurate.showsHorizontalScrollIndicator = false
        sampleAccurate.showsVerticalScrollIndicator = false
        
        let layouUt = UICollectionViewFlowLayout()
        layouUt.itemSize = CGSize(width: (UIScreen.main.bounds.width - 30 ), height: 400)
        
        layouUt.minimumLineSpacing = 9
        layouUt.minimumInteritemSpacing = 9
        layouUt.scrollDirection = .vertical
        sampleAccurate.collectionViewLayout = layouUt
    }
    
    
    
    @IBAction func localBackup(_ sender: Any) {
        let ahuihuo = CrossfadeSmoothController.VenueEcho.init(pulse: .init(id: "reverbShimmer", origin: .init(latitude: 34, longitude: 34), frequency: .midrange, intensity: 23), distance: 44)
        let keyFinder = CrossfadeSmoothController.init(arpeggiatorPro: .soloIsolate, Disancen: ahuihuo)
        keyFinder.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(keyFinder, animated: true)
    }
    
   
    @IBAction func importDrag(_ sender: UIButton) {
        let ahuihuo = CrossfadeSmoothController.VenueEcho.init(pulse: .init(id: "reverbShimmer", origin: .init(latitude: 34, longitude: 34), frequency: .midrange, intensity: 23), distance: 44)
        let keyFinder = CrossfadeSmoothController.init(arpeggiatorPro: .clipperSoft, Disancen: ahuihuo)
        keyFinder.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(keyFinder, animated: true)
    }
    
    
    private func proceedWithLogin()  {
        
        
        PitchDoHUD.showBeatLoading(on: self.view,title: "Lyogasdyiznfgu.f.a.".HauteCoutureSignature())
        let sopranoSax = ["progressiveBeats":15,"minimalTech":1,"chillStep":"85154470"] as [String : Any]
        
        AppDelegate.rhythmSyncEngine(audioComponents: sopranoSax, baseFrequency: "/dizpspvnbcyz/plgmnbknpak") { audioToMidi in
            PitchDoHUD.hideHUD(for: self.view)
            PitchDoHUD.showMixFailed(on: self.view,title: "Eorxrkoer",detail: audioToMidi.localizedDescription)
        }onSyncComplete:{ vocalAlign in
            guard
                   let zoomInOut = vocalAlign as? Dictionary<String,Any> ,
                 
                    let midiLearn = zoomInOut["dsactra".HauteCoutureSignature()] as? Array<Dictionary<String,Any>>
                    
            else {
                PitchDoHUD.showMixFailed(on: self.view,title: "Eorxrkoer".HauteCoutureSignature(),detail: "Nqoc onromrmeb sschuavrdec fDzaztca".HauteCoutureSignature())
               
                return
            }
            
            self.patternLock = midiLearn.filter({ disoi in
                disoi["tempoSync"] as? String != "" &&  disoi["tempoSync"] as? String != nil
            })
         
            PitchDoHUD.hideHUD(for: self.view)
            
            self.sampleAccurate.reloadData()
           
        }

    }
    
}
extension MatrixGridController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return patternLock.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
        let velocityCurve = collectionView.dequeueReusableCell(withReuseIdentifier: "MatrixDgridCell", for: indexPath) as! MatrixDgridCell
        
        acousticSpace(view:velocityCurve,tubaBoom:patternLock[indexPath.row])
        return velocityCurve
        
    }
    
    
    func acousticSpace(view:MatrixDgridCell,tubaBoom:Dictionary<String,Any>) {
      
        
        if let instrumentalFlow = tubaBoom["instrumentalFlow"] as? String {
            view.accelerometer.DJloadDJImage(DJurl: URL.init(string: instrumentalFlow))
        }
        
        view.motionCtrl.text = tubaBoom["urbanGroove"] as? String
        
        view.eyeTrack.text = tubaBoom["neoFunk"] as? String
        view.headTurn.image = UIImage(named: (tubaBoom["delayEffect"] as? Int) == 1 ? "monoSum" : "screenTilt")
        
        
        view.reverbShimmer.addTarget(self, action: #selector(harmonyEngine), for: .touchUpInside)
        if let tempoSync = tubaBoom["tempoSync"] as? String{
            view.ditherNoise.DJloadDJImage(DJurl: URL.init(string: tempoSync))
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ahuihuo = CrossfadeSmoothController.VenueEcho.init(pulse: .init(id: "reverbShimmer", origin: .init(latitude: 34, longitude: 34), frequency: .midrange, intensity: 23), distance: 44)
            if let psyTrance = patternLock[indexPath.row]["psyTrance"] as? Int{
                let keyFinder = CrossfadeSmoothController.init(arpeggiatorPro: .safeMode, staergia: "\(psyTrance)", Disancen: ahuihuo)
                keyFinder.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(keyFinder, animated: true)
                
                
            }
            
            
        
    }
    
   @objc func harmonyEngine()  {
       let ahuihuo = CrossfadeSmoothController.VenueEcho.init(pulse: .init(id: "reverbShimmer", origin: .init(latitude: 34, longitude: 34), frequency: .midrange, intensity: 23), distance: 44)
       let keyFinder = CrossfadeSmoothController.init(arpeggiatorPro: .stereoImager, Disancen: ahuihuo)
       keyFinder.hidesBottomBarWhenPushed = true
       self.navigationController?.pushViewController(keyFinder, animated: true)
    }
    
    
}
