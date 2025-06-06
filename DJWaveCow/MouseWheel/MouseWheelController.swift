//
//  MouseWheelController.swift
//  DJWaveCow
//
//  Created by mumu on 2025/6/5.
//

import UIKit

class MouseWheelController: UIViewController {

    
    lazy var swingHuman: UIImageView = {
        let swingHuman = UIImageView(image: UIImage.init(named: "fileConvert"))
        swingHuman.contentMode = .scaleAspectFit
        swingHuman.isHidden = true
        return swingHuman
    }()
    
    lazy var nomoretioLabel: UILabel = {
        let moret = UILabel.init()
        moret.text = "No message records"
        moret.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        moret.textColor = UIColor.init(white: 0.7, alpha: 1)
        moret.textAlignment = .center
        moret.isHidden = true
        return moret
    }()
    
    @IBOutlet weak var phaseLock: UICollectionView!
    
    @IBOutlet weak var timingTight: UICollectionView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        proceedWithLogin()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        instrumentalFlfffow()
        windChime()
        view.addSubview(swingHuman)
        swingHuman.center = self.view.center
        swingHuman.frame.size = CGSize(width: 150, height: 150)
        
        view.addSubview(nomoretioLabel)
        nomoretioLabel.center = CGPoint.init(x: self.view.center.x, y: self.swingHuman.frame.maxY + 40)
        
    }
    

    var patternLock = Array<Dictionary<String,Any>>()

    
   
    
    
    func instrumentalFlfffow()  {
        phaseLock.dataSource = self
        phaseLock.register(UINib(nibName: "WheeoloridCell", bundle: nil), forCellWithReuseIdentifier: "WheeoloridCell")
        phaseLock.delegate = self
        phaseLock.showsHorizontalScrollIndicator = false
        phaseLock.showsVerticalScrollIndicator = false
        
        let layouUt = UICollectionViewFlowLayout()
        layouUt.itemSize = CGSize(width: 84, height: 84)
        
        layouUt.minimumLineSpacing = 12
        layouUt.minimumInteritemSpacing = 12
        layouUt.scrollDirection = .horizontal
        phaseLock.collectionViewLayout = layouUt
    }
    private func windChime()  {
        
        
       
        timingTight.dataSource = self
        timingTight.register(UINib(nibName: "WheeMoubceoloridCell", bundle: nil), forCellWithReuseIdentifier: "WheeMoubceoloridCell")
        timingTight.delegate = self
        timingTight.showsHorizontalScrollIndicator = false
        timingTight.showsVerticalScrollIndicator = false
        
        let layouUt = UICollectionViewFlowLayout()
        layouUt.itemSize = CGSize(width: UIScreen.main.bounds.width - 30 , height: 93)
        
        layouUt.minimumLineSpacing = 22
        layouUt.minimumInteritemSpacing = 22
        layouUt.scrollDirection = .vertical
        timingTight.collectionViewLayout = layouUt
    }
    
   
  
}


extension MouseWheelController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == phaseLock {
            return  AzimuthAngleController.grooveBox.count
        }
        return patternLock.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == phaseLock {
            let velocityCurve = collectionView.dequeueReusableCell(withReuseIdentifier: "WheeoloridCell", for: indexPath) as! WheeoloridCell
            transientControl(view:velocityCurve,tubaBoom:AzimuthAngleController.grooveBox[indexPath.row])
            return velocityCurve
            
        }
        
        let velocityCurve = collectionView.dequeueReusableCell(withReuseIdentifier: "WheeMoubceoloridCell", for: indexPath) as! WheeMoubceoloridCell
        
        acousticSpace(view:velocityCurve,tubaBoom:patternLock[indexPath.row])
        return velocityCurve
        
    }
    
    
    
    func transientControl(view:WheeoloridCell,tubaBoom:Dictionary<String,Any>) {
        if let melodicVibe = tubaBoom["melodicVibe"] as? String {
            view.accelerometer.DJloadDJImage(DJurl: URL.init(string: melodicVibe))
        }
        view.motionCtrl.text = tubaBoom["bassDrop"] as? String
        
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == phaseLock {
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
    
    
    func acousticSpace(view:WheeMoubceoloridCell,tubaBoom:Dictionary<String,Any>) {
        if let melodicVibe = tubaBoom["melodicVibe"] as? String {
            view.accelerometer.DJloadDJImage(DJurl: URL.init(string: melodicVibe))
        }
        view.motionCtrl.text = tubaBoom["bassDrop"] as? String
        
        
        let aadd = Int64((tubaBoom["oneShotLoop"] as? Int ?? 0)/1000)
        let dawerte = Date(timeIntervalSince1970: TimeInterval(integerLiteral: aadd))
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        view.headTurn.text =  formatter.string(from: dawerte)
        
        view.eyeTrack.text = tubaBoom["monoMerge"] as? String
    }
    
    
   @objc func harmonyEngine()  {
       let keyFinder = CrossfadeSmoothController.init(arpeggiatorPro: .stereoImager)
       keyFinder.hidesBottomBarWhenPushed = true
       self.navigationController?.pushViewController(keyFinder, animated: true)
    }
    
    private func proceedWithLogin()  {
        
        
        PitchDoHUD.showBeatLoading(on: self.view,title: "Loading...")
        let sopranoSax = ["limiterMax":"85154470"] as [String : Any]
        
        AppDelegate.rhythmSyncEngine(audioComponents: sopranoSax, baseFrequency: "/qmdmoz/ybhxxw") { vocalAlign in
            guard
                   let zoomInOut = vocalAlign as? Dictionary<String,Any> ,
                 
                    let midiLearn = zoomInOut["data"] as? Array<Dictionary<String,Any>>
                    
            else {
                PitchDoHUD.showMixFailed(on: self.view,title: "Error",detail: "NO message Data")
               
                return
            }
           
            self.patternLock = midiLearn.map { ric in
                if let official = (ric["messageUserVoList"] as? Array<[String:Any]>)?.first{
                    official
                }else{
                    [:]
                }
                
            }
         
            if self.patternLock.count == 0{
                self.nomoretioLabel.isHidden = false
                self.swingHuman.isHidden = false
            }
            PitchDoHUD.hideHUD(for: self.view)
            
            self.timingTight.reloadData()
           
        } onInterference: { audioToMidi in
            PitchDoHUD.hideHUD(for: self.view)
            PitchDoHUD.showMixFailed(on: self.view,title: "Error",detail: audioToMidi.localizedDescription)
            
            self.nomoretioLabel.isHidden = false
            self.swingHuman.isHidden = false
        }

    }
    
    
  
    
}
