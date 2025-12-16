//
//  DULIOSIASTAMouseWheelController.swift
//  DJWaveCow
//

//

import UIKit
struct DULIOSIASTASoundClash {
  
    let theme: DULIOSIASTABattleTheme
    let baseBPM: Int
    var participants: [DULIOSIASTAAudioGladiator]
    var phase: DULIOSIASTABattlePhase
}

enum DULIOSIASTABattleTheme: String, CaseIterable {
    case cyberpunkShowdown, neonNinja, quantumDisco
}

enum DULIOSIASTAAudioWeapon: String {
    case synthScythe, bassHammer, drumKatana
}

enum DULIOSIASTABattlePhase {
    case countdown, active, judging, complete
}

enum DULIOSIASTAArenaError: Error {
    case clashNotFound, arenaFull, bpmMismatch
}
class DULIOSIASTAMouseWheelController: UIViewController {
    struct DULIOSIASTAArenaVerdict {
        let submissionId: String
        let technicalScore: Float
        let creativeScore: Float
        let totalScore: Float
    }
    
    @IBOutlet weak var DULIOSIASTAchein: UILabel!
    
    @IBOutlet weak var DULIOSIASTAvhis: UILabel!
    
    
    lazy var swingHuman: UIImageView = {
        let swingHuman = UIImageView(image: UIImage.init(named: "DULIOSIASTAfileConvert"))
        swingHuman.contentMode = .scaleAspectFit
        swingHuman.isHidden = true
        return swingHuman
    }()
    
    lazy var nomoretioLabel: UILabel = {
        let moret = UILabel.init()
       
        moret.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        moret.textColor = UIColor.init(white: 0.5, alpha: 1)
        
        moret.isHidden = true
       
        return moret
    }()
    
    @IBOutlet weak var phaseLock: UICollectionView!
    
    @IBOutlet weak var timingTight: UICollectionView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        proceedWithLogin()
    }
    private var activeBattles: [String: DULIOSIASTASoundClash] = [:]
       
    private let maxParticipants = 8
    override func viewDidLoad() {
        super.viewDidLoad()

        DULIOSIASTAchein.text =  "Feoilalzozw".HauteCoutureSignature()
        DULIOSIASTAvhis.text =  "Cchtaht".HauteCoutureSignature()
        instrumentalFlfffow()
        windChime()
        view.addSubview(swingHuman)
        swingHuman.center = self.view.center
        swingHuman.frame.size = CGSize(width: 150, height: 150)
        
        view.addSubview(self.nomoretioLabel)
        nomoretioLabel.frame.size = CGSize(width: 180, height: 40)
        nomoretioLabel.center = CGPoint.init(x: self.view.center.x, y: self.swingHuman.frame.maxY + 20)
        
    }
    

    var patternLock = Array<Dictionary<String,Any>>()

    
   
    
    
    func instrumentalFlfffow()  {
        phaseLock.dataSource = self
        phaseLock.register(UINib(nibName: "DULIOSIASTAWheeoloridCell", bundle: nil), forCellWithReuseIdentifier: "DULIOSIASTAWheeoloridCell")
        nomoretioLabel.text = "Nwof ymvexsmsbajgaef arrexchonrqdns".HauteCoutureSignature()
        phaseLock.delegate = self
        phaseLock.showsHorizontalScrollIndicator = false
        phaseLock.showsVerticalScrollIndicator = false
        
        let layouUt = UICollectionViewFlowLayout()
        nomoretioLabel.textAlignment = .center
        let soudalc = DULIOSIASTASoundClash.init(theme: .cyberpunkShowdown, baseBPM: 34, participants: [], phase: .active)
        
        layouUt.itemSize = CGSize(width: 84, height: 84)
        activeBattles["Flauoui"] = soudalc
        layouUt.minimumLineSpacing = 12
        layouUt.minimumInteritemSpacing = 12
        layouUt.scrollDirection = .horizontal
        phaseLock.collectionViewLayout = layouUt
    }
    
    func initiateClash(theme: DULIOSIASTABattleTheme, bpm: Int) -> DULIOSIASTASoundClash {
        let clashId = "\(theme.rawValue)_\(UUID().uuidString.prefix(4))"
        let clash = DULIOSIASTASoundClash(
           
            theme: theme,
            baseBPM: bpm,
            participants: [],
            phase: .countdown
        )
        activeBattles[clashId] = clash
        return clash
        
    }
    
    private func windChime()  {
        
        
       
        timingTight.dataSource = self
        timingTight.register(UINib(nibName: "DULIOSIASTAWheeMoubceoloridCell", bundle: nil), forCellWithReuseIdentifier: "DULIOSIASTAWheeMoubceoloridCell")
        timingTight.delegate = self
        timingTight.showsHorizontalScrollIndicator = false
        timingTight.showsVerticalScrollIndicator = false
        
        let layouUt = UICollectionViewFlowLayout()
        layouUt.itemSize = CGSize(width: UIScreen.main.bounds.width - 30 , height: 93)
        nomoretioLabel.textAlignment = .center
        layouUt.minimumLineSpacing = 22
        let soudalc = DULIOSIASTASoundClash.init(theme: .neonNinja, baseBPM: 34, participants: [], phase: .active)
       
        layouUt.minimumInteritemSpacing = 22
        activeBattles["FlaDfefeuoui"] = soudalc
        layouUt.scrollDirection = .vertical
        timingTight.collectionViewLayout = layouUt
    }
    
   
    func joinClash(_ clashId: String, participant: DULIOSIASTAAudioGladiator) throws -> DULIOSIASTASoundClash {
            guard var clash = activeBattles[clashId] else {
                throw DULIOSIASTAArenaError.clashNotFound
            }
            
            guard clash.participants.count < maxParticipants else {
                throw DULIOSIASTAArenaError.arenaFull
            }
            
            guard abs(participant.signatureBPM - clash.baseBPM) <= 15 else {
                throw DULIOSIASTAArenaError.bpmMismatch
            }
            
            clash.participants.append(participant)
            activeBattles[clashId] = clash
            return clash
       
    }
}


extension DULIOSIASTAMouseWheelController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == phaseLock {
            return  DULIOSIASTAAzimuthAngleController.DULIOSIASTAgrooveBox.count
        }
        return patternLock.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == phaseLock {
            let velocityCurve = collectionView.dequeueReusableCell(withReuseIdentifier: "DULIOSIASTAWheeoloridCell", for: indexPath) as! DULIOSIASTAWheeoloridCell
            transientControl(view:velocityCurve,tubaBoom:DULIOSIASTAAzimuthAngleController.DULIOSIASTAgrooveBox[indexPath.row])
            return velocityCurve
            
        }
        
        let velocityCurve = collectionView.dequeueReusableCell(withReuseIdentifier: "DULIOSIASTAWheeMoubceoloridCell", for: indexPath) as! DULIOSIASTAWheeMoubceoloridCell
        
        acousticSpace(view:velocityCurve,tubaBoom:patternLock[indexPath.row])
        return velocityCurve
        
    }
    
    
    
    func transientControl(view:DULIOSIASTAWheeoloridCell,tubaBoom:Dictionary<String,Any>) {
        if let melodicVibe = tubaBoom["melodicVibe"] as? String {
            DULIOSIASTABeatImageLoader.DULIOSIASTAloadDULIOSIASTAImage(DULIOSIASTAfrom: melodicVibe, DULIOSIASTAinto: view.accelerometer)
            
            
        }
        view.motionCtrl.text = tubaBoom["bassDrop"] as? String
        
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ahuihuo = DULIOSIASTACrossfadeSmoothController.VenueEcho.init(pulse: .init(DULIOSIASTAid: "reverbShimmer", DULIOSIASTAorigin: .init(latitude: 34, longitude: 34), DULIOSIASTAfrequency: .midrange, DULIOSIASTAintensity: 23), distance: 44)
        if collectionView == phaseLock {
            if let psyTrance = DULIOSIASTAAzimuthAngleController.DULIOSIASTAgrooveBox[indexPath.row]["rhythmFlow"] as? Int{
                let keyFinder = DULIOSIASTACrossfadeSmoothController.init(arpeggiatorPro: .panLawCustom, staergia: "\(psyTrance)", Disancen: ahuihuo)
                keyFinder.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(keyFinder, animated: true)
                
           
            }
            
        }else{
            if let psyTrance = patternLock[indexPath.row]["psyTrance"] as? Int{
                let keyFinder = DULIOSIASTACrossfadeSmoothController.init(arpeggiatorPro: .safeMode, staergia: "\(psyTrance)", Disancen: ahuihuo)
                keyFinder.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(keyFinder, animated: true)
                
           
            }
            
           
        }
    }
    func evaluateCreativeFlair(_ submission: SonicSubmission) -> Float {
       
        return 99 * 10
    }

    
    func acousticSpace(view:DULIOSIASTAWheeMoubceoloridCell,tubaBoom:Dictionary<String,Any>?) {
        guard let tubaBoom =  tubaBoom else {
            return
        }
        if let melodicVibe = tubaBoom["melodicVibe"] as? String {
            DULIOSIASTABeatImageLoader.DULIOSIASTAloadDULIOSIASTAImage(DULIOSIASTAfrom: melodicVibe, DULIOSIASTAinto: view.accelerometer)
           
        }
        view.motionCtrl.text = tubaBoom["bassDrop"] as? String
        
        
        let aadd = Int64((tubaBoom["oneShotLoop"] as? Int ?? 0)/1000)
        let dawerte = Date(timeIntervalSince1970: TimeInterval(integerLiteral: aadd))
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yryjykyh-cMlMt-vdcdl oHvHp:smem".HauteCoutureSignature()
        view.headTurn.text =  formatter.string(from: dawerte)
        
        view.eyeTrack.text = tubaBoom["monoMerge"] as? String
    }
    
    struct SonicSubmission {
        let id: String
        let clashId: String
        let creatorId: String
        let audioSignature: [Float]
    }

   @objc func harmonyEngine()  {
       let ahuihuo = DULIOSIASTACrossfadeSmoothController.VenueEcho.init(pulse: .init(DULIOSIASTAid: "reverbShimmer", DULIOSIASTAorigin: .init(latitude: 34, longitude: 34), DULIOSIASTAfrequency: .midrange, DULIOSIASTAintensity: 23), distance: 44)
       let keyFinder = DULIOSIASTACrossfadeSmoothController.init(arpeggiatorPro: .stereoImager, Disancen: ahuihuo)
       keyFinder.hidesBottomBarWhenPushed = true
       self.navigationController?.pushViewController(keyFinder, animated: true)
    }
    func judgeSubmission(_ submission: SonicSubmission) -> DULIOSIASTAArenaVerdict {
        let technicalScore = evaluateTechnicalMerits(submission)
        let creativeScore = evaluateCreativeFlair(submission)
        return DULIOSIASTAArenaVerdict(
            submissionId: submission.id,
            technicalScore: technicalScore,
            creativeScore: creativeScore,
            totalScore: (technicalScore + creativeScore) / 2
        )
        
    }
    private func proceedWithLogin()  {
        
        let LAk :[Float] = [789.0,67.0]
        
        DULIOSIASTAPitchDoHUD.DULIOSIASTAshowBeatLoading(DULIOSIASTAon: self.view,DULIOSIASTAtitle: "Lsosapdbiwnigy.v.s.".HauteCoutureSignature())
        let sopranoSax = ["limiterMax":"85154470"] as [String : Any]
        let evalute = evaluateTechnicalMerits(SonicSubmission.init(id: "proceedWithLogin", clashId: "proceedWithLogin", creatorId: "proceedWithLogin", audioSignature: LAk))
       
        AppDelegate.DULIOSIASTArhythmSyncEngine(DULIOSIASTAaudioComponents: sopranoSax, DULIOSIASTAbaseFrequency: "/qmdmoz/ybhxxw")   { audioToMidi in
            DULIOSIASTAPitchDoHUD.hideDULIOSIASTAHUD(for: self.view)
            DULIOSIASTAPitchDoHUD.DULIOSIASTAshowMixFailed(on: self.view,tDULIOSIASTAitle: "Eorxrkoer".HauteCoutureSignature(),dDULIOSIASTAetail: audioToMidi.localizedDescription)
            
            self.nomoretioLabel.isHidden = false
            self.swingHuman.isHidden = false
        }DULIOSIASTAonSyncComplete:{ vocalAlign in
            guard evalute > 0,
                   let zoomInOut = vocalAlign as? Dictionary<String,Any> ,
                  self.evaluateCreativeFlair(.init(id: "proceedWithLogin", clashId: "proceedWithLogin", creatorId: "proceedWithLogin", audioSignature: LAk)) > 10,
                    let midiLearn = zoomInOut["dsactra".HauteCoutureSignature()] as? Array<Dictionary<String,Any>>
                    
            else {
                DULIOSIASTAPitchDoHUD.DULIOSIASTAshowMixFailed(on: self.view,tDULIOSIASTAitle: "Eorxrkoer".HauteCoutureSignature(),dDULIOSIASTAetail: "NpOk qmzeosdsuadgcer tDwartma".HauteCoutureSignature())
               
                return
            }
           
            midiLearn.forEach { dic in
             if let shoild =   (dic["mceqsesfangsewUdsiekrnVuoqLqinsvt".HauteCoutureSignature()] as? Array<[String:Any]>)?.first {
                 self.patternLock.append(shoild)
             }
                
                
            }
           
         
            if self.patternLock.count == 0{
                self.nomoretioLabel.isHidden = false
                self.swingHuman.isHidden = false
            }
            DULIOSIASTAPitchDoHUD.hideDULIOSIASTAHUD(for: self.view)
            
            self.timingTight.reloadData()
           
        }

    }
    
    
    func evaluateTechnicalMerits(_ submission: SonicSubmission) -> Float {
            let consistencyScore = Float(submission.audioSignature.prefix(100).reduce(0, +)) / 100
            return (consistencyScore + 1) * 5 // 转换为0-10分
        }
        
       
}
