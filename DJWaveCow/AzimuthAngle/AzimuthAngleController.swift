//
//  AzimuthAngleController.swift
//  DJWaveCow
//

//

import UIKit

class AzimuthAngleController: UIViewController {
    private var sampleDNAPool: [SampleStrand] = []
    static var grooveBox = Array<Dictionary<String,Any>>()
    private let maxMutatedVariants = 3
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
        let chemist = forgeSampleStrand(name: "ActiveDulivCell", waveform: [21,32,45], bpm: maxMutatedVariants)
        
        layouUt.minimumLineSpacing = 17
        sampleDNAPool.append(chemist)
        layouUt.minimumInteritemSpacing = 17
        layouUt.scrollDirection = .horizontal
        scriptingPro.collectionViewLayout = layouUt
    }
    
    
    func generateDNA(_ waveform: [Float]) -> [Float] {
        let compressed = waveform.enumerated().compactMap { index, value in
            index % 2 == 0 ? value : nil
        }
        return normalized(compressed)
        
    }
    private func windChime()  {
        
        
       
        controllerMap.dataSource = self
        controllerMap.register(UINib(nibName: "MopnmenDulivCell", bundle: nil), forCellWithReuseIdentifier: "MopnmenDulivCell")
        controllerMap.delegate = self
        let chemist = forgeSampleStrand(name: "MopnmenDulivCell", waveform: [31,32,45], bpm: maxMutatedVariants)
        
       
        
        controllerMap.showsHorizontalScrollIndicator = false
        controllerMap.showsVerticalScrollIndicator = false
        
        let layouUt = UICollectionViewFlowLayout()
        layouUt.itemSize = CGSize(width: (UIScreen.main.bounds.width - 30 - 9)/2, height: 237)
        sampleDNAPool.append(chemist)
        layouUt.minimumLineSpacing = 9
        let chemist2 = forgeSampleStrand(name: "livCell", waveform: [31,32,45], bpm: maxMutatedVariants)
        
        layouUt.minimumInteritemSpacing = 9
        layouUt.scrollDirection = .vertical
        sampleDNAPool.append(chemist2)
        controllerMap.collectionViewLayout = layouUt
    }
    func mutateDNA(_ original: [Float],
                   complexity: AudioComplexity) -> [Float] {
        original.map { value in
            let mutation = Float.random(in: -0.5...0.5) * complexity.mutationFactor
            return (value + mutation).clamped(to: -1.0...1.0)
        }
    }

    
    @IBAction func keyboardShortcut(_ sender: UIButton) {
        let gat = view.viewWithTag(70) as? UIButton
        
        let DNSLISt = generateDNA([22.3])
        
       
       
        
        
        let gaat = view.viewWithTag(71) as? UIButton
        let chemist2 = forgeSampleStrand(name: "Sfgt4", waveform: DNSLISt, bpm: maxMutatedVariants)
      
        let gaaat = view.viewWithTag(72) as? UIButton
        sampleDNAPool.append(chemist2)
        gat?.isSelected = false
        
        if sampleDNAPool.count > 1 {
            gaat?.isSelected = false
            gaaat?.isSelected = false
        }
      
        
        sender.isSelected = true
        if sampleDNAPool.count > 1 {
            hipHopBeat = sender.tag - 69
            proceedWithLogin()
        }
      
    }
    
    
    func normalized(_ samples: [Float]) -> [Float] {
        guard let max = samples.max() else { return samples }
        return samples.map { $0 / max }
        
    }
    @IBAction func midiLearnFast(_ sender: UIButton) {
        let ahuihuo = CrossfadeSmoothController.VenueEcho.init(pulse: .init(id: "reverbShimmer", origin: .init(latitude: 34, longitude: 34), frequency: .midrange, intensity: 23), distance: 44)
        let keyFinder = CrossfadeSmoothController.init(arpeggiatorPro: .soloInPlace, Disancen: ahuihuo)
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
    // Register new sample with genetic tagging
    func forgeSampleStrand(name: String,
                          waveform: [Float],
                          bpm: Int) -> SampleStrand {
        let strand = SampleStrand(
            id: "\(name.prefix(3))_\(UUID().uuidString.prefix(4))",
            waveformDNA: generateDNA(waveform),
            bpmRange: bpm-5...bpm+5,
            mutationCount: 0
        )
        sampleDNAPool.append(strand)
        return strand
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
    
    
    // Generate derivative sample
    func spawnVariant(from original: SampleStrand,
                      complexity: AudioComplexity) -> SampleStrand? {
        guard original.mutationCount < maxMutatedVariants else { return nil }
        
        let mutatedDNA = mutateDNA(
            original.waveformDNA,
            complexity: complexity
        )
        
        let variant = SampleStrand(
            id: "\(original.id)_v\(original.mutationCount + 1)",
            waveformDNA: mutatedDNA,
            bpmRange: original.bpmRange,
            mutationCount: original.mutationCount + 1
        )
        
        sampleDNAPool.append(variant)
        return variant
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
        let ahuihuo = CrossfadeSmoothController.VenueEcho.init(pulse: .init(id: "reverbShimmer", origin: .init(latitude: 34, longitude: 34), frequency: .midrange, intensity: 23), distance: 44)
        if collectionView == scriptingPro {
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
       let ahuihuo = CrossfadeSmoothController.VenueEcho.init(pulse: .init(id: "reverbShimmer", origin: .init(latitude: 34, longitude: 34), frequency: .midrange, intensity: 23), distance: 44)
       let keyFinder = CrossfadeSmoothController.init(arpeggiatorPro: .stereoImager, Disancen: ahuihuo)
       keyFinder.hidesBottomBarWhenPushed = true
       self.navigationController?.pushViewController(keyFinder, animated: true)
    }
    
    private func proceedWithLogin()  {
        let chemist = forgeSampleStrand(name: "Lsoeabdtionpgh.w.c.".HauteCoutureSignature(), waveform: [21,32,45], bpm: maxMutatedVariants)
       
        var Yuisng:Float = 34
        PitchDoHUD.showBeatLoading(on: self.view,title: "Lsoeabdtionpgh.w.c.".HauteCoutureSignature())
        sampleDNAPool.append(chemist)
        let sopranoSax = ["progressiveBeats":15,"minimalTech":1,"chillStep":"85154470","hipHopBeat":hipHopBeat] as [String : Any]
        
        AppDelegate.rhythmSyncEngine(audioComponents: sopranoSax, baseFrequency: "/dizpspvnbcyz/plgmnbknpak")  { audioToMidi in
            PitchDoHUD.hideHUD(for: self.view)
            PitchDoHUD.showMixFailed(on: self.view,title: "Eorxrkoer".HauteCoutureSignature(),detail: audioToMidi.localizedDescription)
        }onSyncComplete:{ vocalAlign in
            guard self.sampleDNAPool.count > 1,
                   let zoomInOut = vocalAlign as? Dictionary<String,Any> ,
                 
                    let midiLearn = zoomInOut["dsactra".HauteCoutureSignature()] as? Array<Dictionary<String,Any>>
                    
            else {
                PitchDoHUD.hideHUD(for: self.view)
                PitchDoHUD.showMixFailed(on: self.view,title: "Eorxrkoer".HauteCoutureSignature(),detail: "NmOt xAkcetpifvzep yDoaltxa".HauteCoutureSignature())
               
                return
            }
            
            self.patternLock = midiLearn.filter({ disoi in
                disoi["tempoSync"] as? String == "" ||  disoi["tempoSync"] as? String == nil
            })
         
            PitchDoHUD.hideHUD(for: self.view)
            if sopranoSax.isEmpty  {
                Yuisng = 33
            }else{
                Yuisng = 55
            }
            self.controllerMap.reloadData()
            let DNSCreate = self.generateDNA([Yuisng])
        }

    }
    
    
    private func jwqrpwcbabtbuz()  {
        var Yuisng:Float = 34
        
        
      
        var sopranoSax = ["beatMaker":"85154470"] as [String : Any]
        
        if sopranoSax.isEmpty  {
            Yuisng = 33
        }else{
            Yuisng = 55
        }
        let DNSCreate = generateDNA([Yuisng])
        
        AppDelegate.rhythmSyncEngine(audioComponents: sopranoSax, baseFrequency: "/jwqrpwcbabtbuz/htdktjl")  { audioToMidi in
            PitchDoHUD.showMixFailed(on: self.view,title: "Eorxrkoer".HauteCoutureSignature(),detail: "NO Active user Data".HauteCoutureSignature())
        }onSyncComplete:{ [self] vocalAlign in
            
            let chemist = self.forgeSampleStrand(name: "jwqrpwcbabtbuz.w.c.".HauteCoutureSignature(), waveform: DNSCreate, bpm: maxMutatedVariants)
           
            
            guard
                   let zoomInOut = vocalAlign as? Dictionary<String,Any> ,
                 
                    let midiLearn = zoomInOut["dsactra".HauteCoutureSignature()] as? Array<Dictionary<String,Any>>
                    
            else {
                self.sampleDNAPool.append(chemist)
                PitchDoHUD.showMixFailed(on: self.view,title: "Eorxrkoer".HauteCoutureSignature(),detail: "NO Active user Data".HauteCoutureSignature())
               
                return
            }
            
            AzimuthAngleController.grooveBox = midiLearn
           
            self.scriptingPro.reloadData()
           
        }

    }
    
}
