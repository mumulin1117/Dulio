//
//  AzimuthAngleController.swift
//  DJWaveCow
//
//  Created by mumu on 2025/6/5.
//

import UIKit

class AzimuthAngleController: UIViewController {

    static var grooveBox = Array<Dictionary<String,Any>>()
    
    @IBOutlet weak var scriptingPro: UICollectionView!
    
    var hipHopBeat:Int = 1
    
    @IBOutlet weak var statusBagview: UIStackView!
    var patternLock = Array<Dictionary<String,Any>>()
    @IBOutlet weak var controllerMap: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusBagview.layer.cornerRadius = 12
        statusBagview.layer.masksToBounds = true
        instrumentalFlfffow()
        windChime()
        
        jwqrpwcbabtbuz()
        proceedWithLogin()
    }
    
    
    func instrumentalFlfffow()  {
        scriptingPro.dataSource = self
        scriptingPro.register(UINib(nibName: "ActiveDulivCell", bundle: nil), forCellWithReuseIdentifier: "ActiveDulivCell")
        scriptingPro.delegate = self
        scriptingPro.showsHorizontalScrollIndicator = false
        scriptingPro.showsVerticalScrollIndicator = false
        
        let layouUt = UICollectionViewFlowLayout()
        layouUt.itemSize = CGSize(width: 164, height: 60)
        
        layouUt.minimumLineSpacing = 17
        layouUt.minimumInteritemSpacing = 17
        layouUt.scrollDirection = .horizontal
        scriptingPro.collectionViewLayout = layouUt
    }
    private func windChime()  {
        
        
       
        controllerMap.dataSource = self
        controllerMap.register(UINib(nibName: "MopnmenDulivCell", bundle: nil), forCellWithReuseIdentifier: "MopnmenDulivCell")
        controllerMap.delegate = self
        controllerMap.showsHorizontalScrollIndicator = false
        controllerMap.showsVerticalScrollIndicator = false
        
        let layouUt = UICollectionViewFlowLayout()
        layouUt.itemSize = CGSize(width: (UIScreen.main.bounds.width - 30 - 9)/2, height: 237)
        
        layouUt.minimumLineSpacing = 9
        layouUt.minimumInteritemSpacing = 9
        layouUt.scrollDirection = .vertical
        controllerMap.collectionViewLayout = layouUt
    }
    
    
    @IBAction func keyboardShortcut(_ sender: UIButton) {
        let gat = view.viewWithTag(70) as? UIButton
        let gaat = view.viewWithTag(71) as? UIButton
        let gaaat = view.viewWithTag(72) as? UIButton
        
        gat?.isSelected = false
        gaat?.isSelected = false
        gaaat?.isSelected = false
        
        sender.isSelected = true
        hipHopBeat = sender.tag - 69
        proceedWithLogin()
    }
    
    
    @IBAction func midiLearnFast(_ sender: UIButton) {
        
        let keyFinder = CrossfadeSmoothController.init(arpeggiatorPro: .soloInPlace)
        keyFinder.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(keyFinder, animated: true)
        
    }
}


extension AzimuthAngleController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == scriptingPro {
            return  AzimuthAngleController.grooveBox.count
        }
        return patternLock.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == scriptingPro {
            let velocityCurve = collectionView.dequeueReusableCell(withReuseIdentifier: "ActiveDulivCell", for: indexPath) as! ActiveDulivCell
            transientControl(view:velocityCurve,tubaBoom:AzimuthAngleController.grooveBox[indexPath.row])
            return velocityCurve
            
        }
        
        let velocityCurve = collectionView.dequeueReusableCell(withReuseIdentifier: "MopnmenDulivCell", for: indexPath) as! MopnmenDulivCell
        
        acousticSpace(view:velocityCurve,tubaBoom:patternLock[indexPath.row])
        return velocityCurve
        
    }
    
    
    
    func transientControl(view:ActiveDulivCell,tubaBoom:Dictionary<String,Any>) {
        if let melodicVibe = tubaBoom["melodicVibe"] as? String {
            view.accelerometer.DJloadDJImage(DJurl: URL.init(string: melodicVibe))
        }
        view.motionCtrl.text = tubaBoom["bassDrop"] as? String
        
        view.eyeTrack.text = "\(tubaBoom["techHouse"] as? Int ?? 0) Fans"
        view.headTurn.image = UIImage(named: (tubaBoom["tranceDream"] as? Int) == 1 ? "guanhzujd" : "treingfort")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == scriptingPro {
            if let psyTrance = AzimuthAngleController.grooveBox[indexPath.row]["rhythmFlow"] as? Int{
                let keyFinder = CrossfadeSmoothController.init(arpeggiatorPro: .panLawCustom, staergia: "\(psyTrance)")
                keyFinder.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(keyFinder, animated: true)
                
           
            }
            
        }else{
            if let psyTrance = patternLock[indexPath.row]["psyTrance"] as? Int{
                let keyFinder = CrossfadeSmoothController.init(arpeggiatorPro: .safeMode, staergia: "\(psyTrance)")
                keyFinder.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(keyFinder, animated: true)
                
           
            }
            
           
        }
    }
    
    
    func acousticSpace(view:MopnmenDulivCell,tubaBoom:Dictionary<String,Any>) {
        if let echoChamber = tubaBoom["echoChamber"] as? Array<String>,let ret = echoChamber.first  {
            view.headTurn.DJloadDJImage(DJurl: URL.init(string: ret))
        }
        
        if let instrumentalFlow = tubaBoom["instrumentalFlow"] as? String {
            view.accelerometer.DJloadDJImage(DJurl: URL.init(string: instrumentalFlow))
        }
        
        view.motionCtrl.text = tubaBoom["urbanGroove"] as? String
        
        view.eyeTrack.text = tubaBoom["neoFunk"] as? String
        view.ditherNoise.image = UIImage(named: (tubaBoom["delayEffect"] as? Int) == 1 ? "monoSum" : "screenTilt")
        
        
        view.reverbShimmer.addTarget(self, action: #selector(harmonyEngine), for: .touchUpInside)
        
    }
    
    
   @objc func harmonyEngine()  {
       let keyFinder = CrossfadeSmoothController.init(arpeggiatorPro: .stereoImager)
       keyFinder.hidesBottomBarWhenPushed = true
       self.navigationController?.pushViewController(keyFinder, animated: true)
    }
    
    private func proceedWithLogin()  {
        
        
        PitchDoHUD.showBeatLoading(on: self.view,title: "Loading...")
        let sopranoSax = ["progressiveBeats":15,"minimalTech":1,"chillStep":"85154470","hipHopBeat":hipHopBeat] as [String : Any]
        
        AppDelegate.rhythmSyncEngine(audioComponents: sopranoSax, baseFrequency: "/dizpspvnbcyz/plgmnbknpak") { vocalAlign in
            guard
                   let zoomInOut = vocalAlign as? Dictionary<String,Any> ,
                 
                    let midiLearn = zoomInOut["data"] as? Array<Dictionary<String,Any>>
                    
            else {
                PitchDoHUD.showMixFailed(on: self.view,title: "Error",detail: "NO Active Data")
               
                return
            }
            
            self.patternLock = midiLearn.filter({ disoi in
                disoi["tempoSync"] as? String == "" ||  disoi["tempoSync"] as? String == nil
            })
         
            PitchDoHUD.hideHUD(for: self.view)
            
            self.controllerMap.reloadData()
           
        } onInterference: { audioToMidi in
            PitchDoHUD.hideHUD(for: self.view)
            PitchDoHUD.showMixFailed(on: self.view,title: "Error",detail: audioToMidi.localizedDescription)
        }

    }
    
    
    private func jwqrpwcbabtbuz()  {
        
      
        let sopranoSax = ["beatMaker":"85154470"] as [String : Any]
        
        AppDelegate.rhythmSyncEngine(audioComponents: sopranoSax, baseFrequency: "/jwqrpwcbabtbuz/htdktjl") { vocalAlign in
            guard
                   let zoomInOut = vocalAlign as? Dictionary<String,Any> ,
                 
                    let midiLearn = zoomInOut["data"] as? Array<Dictionary<String,Any>>
                    
            else {
                PitchDoHUD.showMixFailed(on: self.view,title: "Error",detail: "NO Active Data")
               
                return
            }
            
            AzimuthAngleController.grooveBox = midiLearn
           
            self.scriptingPro.reloadData()
           
        } onInterference: { audioToMidi in
           
        }

    }
    
}
