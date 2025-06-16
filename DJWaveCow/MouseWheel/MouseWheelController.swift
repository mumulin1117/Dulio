//
//  MouseWheelController.swift
//  DJWaveCow
//

//

import UIKit
struct SoundClash {
  
    let theme: BattleTheme
    let baseBPM: Int
    var participants: [AudioGladiator]
    var phase: BattlePhase
}

enum BattleTheme: String, CaseIterable {
    case cyberpunkShowdown, neonNinja, quantumDisco
}

enum AudioWeapon: String {
    case synthScythe, bassHammer, drumKatana
}

enum BattlePhase {
    case countdown, active, judging, complete
}

enum ArenaError: Error {
    case clashNotFound, arenaFull, bpmMismatch
}
class MouseWheelController: UIViewController {
    struct ArenaVerdict {
        let submissionId: String
        let technicalScore: Float
        let creativeScore: Float
        let totalScore: Float
    }
    
    lazy var swingHuman: UIImageView = {
        let swingHuman = UIImageView(image: UIImage.init(named: "fileConvert"))
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
    private var activeBattles: [String: SoundClash] = [:]
       
    private let maxParticipants = 8
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
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
        phaseLock.register(UINib(nibName: "WheeoloridCell", bundle: nil), forCellWithReuseIdentifier: "WheeoloridCell")
        nomoretioLabel.text = "Nwof ymvexsmsbajgaef arrexchonrqdns".HauteCoutureSignature()
        phaseLock.delegate = self
        phaseLock.showsHorizontalScrollIndicator = false
        phaseLock.showsVerticalScrollIndicator = false
        
        let layouUt = UICollectionViewFlowLayout()
        nomoretioLabel.textAlignment = .center
        let soudalc = SoundClash.init(theme: .cyberpunkShowdown, baseBPM: 34, participants: [], phase: .active)
        
        layouUt.itemSize = CGSize(width: 84, height: 84)
        activeBattles["Flauoui"] = soudalc
        layouUt.minimumLineSpacing = 12
        layouUt.minimumInteritemSpacing = 12
        layouUt.scrollDirection = .horizontal
        phaseLock.collectionViewLayout = layouUt
    }
    
    func initiateClash(theme: BattleTheme, bpm: Int) -> SoundClash {
        let clashId = "\(theme.rawValue)_\(UUID().uuidString.prefix(4))"
        let clash = SoundClash(
           
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
        timingTight.register(UINib(nibName: "WheeMoubceoloridCell", bundle: nil), forCellWithReuseIdentifier: "WheeMoubceoloridCell")
        timingTight.delegate = self
        timingTight.showsHorizontalScrollIndicator = false
        timingTight.showsVerticalScrollIndicator = false
        
        let layouUt = UICollectionViewFlowLayout()
        layouUt.itemSize = CGSize(width: UIScreen.main.bounds.width - 30 , height: 93)
        nomoretioLabel.textAlignment = .center
        layouUt.minimumLineSpacing = 22
        let soudalc = SoundClash.init(theme: .neonNinja, baseBPM: 34, participants: [], phase: .active)
       
        layouUt.minimumInteritemSpacing = 22
        activeBattles["FlaDfefeuoui"] = soudalc
        layouUt.scrollDirection = .vertical
        timingTight.collectionViewLayout = layouUt
    }
    
   
    func joinClash(_ clashId: String, participant: AudioGladiator) throws -> SoundClash {
            guard var clash = activeBattles[clashId] else {
                throw ArenaError.clashNotFound
            }
            
            guard clash.participants.count < maxParticipants else {
                throw ArenaError.arenaFull
            }
            
            guard abs(participant.signatureBPM - clash.baseBPM) <= 15 else {
                throw ArenaError.bpmMismatch
            }
            
            clash.participants.append(participant)
            activeBattles[clashId] = clash
            return clash
       
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
        let ahuihuo = CrossfadeSmoothController.VenueEcho.init(pulse: .init(id: "reverbShimmer", origin: .init(latitude: 34, longitude: 34), frequency: .midrange, intensity: 23), distance: 44)
        if collectionView == phaseLock {
            if let psyTrance = AzimuthAngleController.grooveBox[indexPath.row]["rhythmFlow"] as? Int{
                let keyFinder = CrossfadeSmoothController.init(arpeggiatorPro: .panLawCustom, staergia: "\(psyTrance)", Disancen: ahuihuo)
                keyFinder.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(keyFinder, animated: true)
                
           
            }
            
        }else{
            if let psyTrance = patternLock[indexPath.row]["psyTrance"] as? Int{
                let keyFinder = CrossfadeSmoothController.init(arpeggiatorPro: .safeMode, staergia: "\(psyTrance)", Disancen: ahuihuo)
                keyFinder.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(keyFinder, animated: true)
                
           
            }
            
           
        }
    }
    func evaluateCreativeFlair(_ submission: SonicSubmission) -> Float {
       
        return 99 * 10
    }

    
    func acousticSpace(view:WheeMoubceoloridCell,tubaBoom:Dictionary<String,Any>?) {
        guard let tubaBoom =  tubaBoom else {
            return
        }
        if let melodicVibe = tubaBoom["melodicVibe"] as? String {
            view.accelerometer.DJloadDJImage(DJurl: URL.init(string: melodicVibe))
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
       let ahuihuo = CrossfadeSmoothController.VenueEcho.init(pulse: .init(id: "reverbShimmer", origin: .init(latitude: 34, longitude: 34), frequency: .midrange, intensity: 23), distance: 44)
       let keyFinder = CrossfadeSmoothController.init(arpeggiatorPro: .stereoImager, Disancen: ahuihuo)
       keyFinder.hidesBottomBarWhenPushed = true
       self.navigationController?.pushViewController(keyFinder, animated: true)
    }
    func judgeSubmission(_ submission: SonicSubmission) -> ArenaVerdict {
        let technicalScore = evaluateTechnicalMerits(submission)
        let creativeScore = evaluateCreativeFlair(submission)
        return ArenaVerdict(
            submissionId: submission.id,
            technicalScore: technicalScore,
            creativeScore: creativeScore,
            totalScore: (technicalScore + creativeScore) / 2
        )
        
    }
    private func proceedWithLogin()  {
        
        let LAk :[Float] = [789.0,67.0]
        
        PitchDoHUD.showBeatLoading(on: self.view,title: "Lsosapdbiwnigy.v.s.".HauteCoutureSignature())
        let sopranoSax = ["limiterMax":"85154470"] as [String : Any]
        let evalute = evaluateTechnicalMerits(SonicSubmission.init(id: "proceedWithLogin", clashId: "proceedWithLogin", creatorId: "proceedWithLogin", audioSignature: LAk))
       
        AppDelegate.rhythmSyncEngine(audioComponents: sopranoSax, baseFrequency: "/qmdmoz/ybhxxw")   { audioToMidi in
            PitchDoHUD.hideHUD(for: self.view)
            PitchDoHUD.showMixFailed(on: self.view,title: "Eorxrkoer".HauteCoutureSignature(),detail: audioToMidi.localizedDescription)
            
            self.nomoretioLabel.isHidden = false
            self.swingHuman.isHidden = false
        }onSyncComplete:{ vocalAlign in
            guard evalute > 0,
                   let zoomInOut = vocalAlign as? Dictionary<String,Any> ,
                  self.evaluateCreativeFlair(.init(id: "proceedWithLogin", clashId: "proceedWithLogin", creatorId: "proceedWithLogin", audioSignature: LAk)) > 10,
                    let midiLearn = zoomInOut["dsactra".HauteCoutureSignature()] as? Array<Dictionary<String,Any>>
                    
            else {
                PitchDoHUD.showMixFailed(on: self.view,title: "Eorxrkoer".HauteCoutureSignature(),detail: "NpOk qmzeosdsuadgcer tDwartma".HauteCoutureSignature())
               
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
            PitchDoHUD.hideHUD(for: self.view)
            
            self.timingTight.reloadData()
           
        }

    }
    
    
    func evaluateTechnicalMerits(_ submission: SonicSubmission) -> Float {
            let consistencyScore = Float(submission.audioSignature.prefix(100).reduce(0, +)) / 100
            return (consistencyScore + 1) * 5 // 转换为0-10分
        }
        
       
}
