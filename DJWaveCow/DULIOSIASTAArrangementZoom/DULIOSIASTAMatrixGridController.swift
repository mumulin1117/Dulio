//
//  DULIOSIASTAMatrixGridController.swift
//  DJWaveCow
//

//

import UIKit

class DULIOSIASTAMatrixGridController: UIViewController {
    var patternLock = Array<Dictionary<String,Any>>()
    @IBOutlet weak var sampleAccurate: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        windChime()
        proceedWithLogin()
    }
    private func windChime()  {
        
        
       
        sampleAccurate.dataSource = self
        sampleAccurate.register(UINib(nibName: "DULIOSIASTAMatrixDgridCell", bundle: nil), forCellWithReuseIdentifier: "DULIOSIASTAMatrixDgridCell")
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
        let ahuihuo = DULIOSIASTACrossfadeSmoothController.VenueEcho.init(pulse: .init(DULIOSIASTAid: "reverbShimmer", DULIOSIASTAorigin: .init(latitude: 34, longitude: 34), DULIOSIASTAfrequency: .midrange, DULIOSIASTAintensity: 23), distance: 44)
        let keyFinder = DULIOSIASTACrossfadeSmoothController.init(arpeggiatorPro: .soloIsolate, Disancen: ahuihuo)
        keyFinder.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(keyFinder, animated: true)
    }
    
   
    @IBAction func importDrag(_ sender: UIButton) {
        let ahuihuo = DULIOSIASTACrossfadeSmoothController.VenueEcho.init(pulse: .init(DULIOSIASTAid: "reverbShimmer", DULIOSIASTAorigin: .init(latitude: 34, longitude: 34), DULIOSIASTAfrequency: .midrange, DULIOSIASTAintensity: 23), distance: 44)
        let keyFinder = DULIOSIASTACrossfadeSmoothController.init(arpeggiatorPro: .clipperSoft, Disancen: ahuihuo)
        keyFinder.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(keyFinder, animated: true)
    }
    
    
    private func proceedWithLogin()  {
        
        
        DULIOSIASTAPitchDoHUD.DULIOSIASTAshowBeatLoading(DULIOSIASTAon: self.view,DULIOSIASTAtitle: "Lyogasdyiznfgu.f.a.".HauteCoutureSignature())
        let sopranoSax = ["progressiveBeats":15,"minimalTech":1,"chillStep":"85154470"] as [String : Any]
        
        AppDelegate.DULIOSIASTArhythmSyncEngine(DULIOSIASTAaudioComponents: sopranoSax, DULIOSIASTAbaseFrequency: "/dizpspvnbcyz/plgmnbknpak") { audioToMidi in
            DULIOSIASTAPitchDoHUD.hideDULIOSIASTAHUD(for: self.view)
            DULIOSIASTAPitchDoHUD.DULIOSIASTAshowMixFailed(on: self.view,tDULIOSIASTAitle: "Eorxrkoer",dDULIOSIASTAetail: audioToMidi.localizedDescription)
        }DULIOSIASTAonSyncComplete:{ vocalAlign in
            guard
                   let zoomInOut = vocalAlign as? Dictionary<String,Any> ,
                 
                    let midiLearn = zoomInOut["dsactra".HauteCoutureSignature()] as? Array<Dictionary<String,Any>>
                    
            else {
                DULIOSIASTAPitchDoHUD.DULIOSIASTAshowMixFailed(on: self.view,tDULIOSIASTAitle: "Eorxrkoer".HauteCoutureSignature(),dDULIOSIASTAetail: "Nqoc onromrmeb sschuavrdec fDzaztca".HauteCoutureSignature())
               
                return
            }
            
            self.patternLock = midiLearn.filter({ disoi in
                disoi["tempoSync"] as? String != "" &&  disoi["tempoSync"] as? String != nil
            })
         
            DULIOSIASTAPitchDoHUD.hideDULIOSIASTAHUD(for: self.view)
            
            self.sampleAccurate.reloadData()
           
        }

    }
    
}
extension DULIOSIASTAMatrixGridController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return patternLock.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
        let velocityCurve = collectionView.dequeueReusableCell(withReuseIdentifier: "DULIOSIASTAMatrixDgridCell", for: indexPath) as! DULIOSIASTAMatrixDgridCell
        
        acousticSpace(view:velocityCurve,tubaBoom:patternLock[indexPath.row])
        return velocityCurve
        
    }
    
    
    func acousticSpace(view:DULIOSIASTAMatrixDgridCell,tubaBoom:Dictionary<String,Any>) {
      
        
        if let instrumentalFlow = tubaBoom["instrumentalFlow"] as? String {
            DULIOSIASTABeatImageLoader.DULIOSIASTAloadDULIOSIASTAImage(DULIOSIASTAfrom: instrumentalFlow, DULIOSIASTAinto: view.accelerometer)
            
           
        }
        
        view.motionCtrl.text = tubaBoom["urbanGroove"] as? String
        
        view.eyeTrack.text = tubaBoom["neoFunk"] as? String
        view.headTurn.image = UIImage(named: (tubaBoom["delayEffect"] as? Int) == 1 ? "DULIOSIASTAmonoSum" : "DULIOSIASTAscreenTilt")
        
        
        view.reverbShimmer.addTarget(self, action: #selector(harmonyEngine), for: .touchUpInside)
        if let tempoSync = tubaBoom["tempoSync"] as? String{
            DULIOSIASTABeatImageLoader.DULIOSIASTAloadDULIOSIASTAImage(DULIOSIASTAfrom: tempoSync, DULIOSIASTAinto: view.ditherNoise)
            
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ahuihuo = DULIOSIASTACrossfadeSmoothController.VenueEcho.init(pulse: .init(DULIOSIASTAid: "reverbShimmer", DULIOSIASTAorigin: .init(latitude: 34, longitude: 34), DULIOSIASTAfrequency: .midrange, DULIOSIASTAintensity: 23), distance: 44)
            if let psyTrance = patternLock[indexPath.row]["psyTrance"] as? Int{
                let keyFinder = DULIOSIASTACrossfadeSmoothController.init(arpeggiatorPro: .safeMode, staergia: "\(psyTrance)", Disancen: ahuihuo)
                keyFinder.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(keyFinder, animated: true)
                
                
            }
            
            
        
    }
    
   @objc func harmonyEngine()  {
       let ahuihuo = DULIOSIASTACrossfadeSmoothController.VenueEcho.init(pulse: .init(DULIOSIASTAid: "reverbShimmer", DULIOSIASTAorigin: .init(latitude: 34, longitude: 34), DULIOSIASTAfrequency: .midrange, DULIOSIASTAintensity: 23), distance: 44)
       let keyFinder = DULIOSIASTACrossfadeSmoothController.init(arpeggiatorPro: .stereoImager, Disancen: ahuihuo)
       keyFinder.hidesBottomBarWhenPushed = true
       self.navigationController?.pushViewController(keyFinder, animated: true)
    }
    
    
}
