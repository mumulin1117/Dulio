//
//  SliderFaderController.swift
//  DJWaveCow
//

//

import UIKit

class SliderFaderController: UIViewController {

    @IBOutlet weak var layoutFlex: UIPageControl!
    
    @IBOutlet weak var audioToMidi: UIImageView!
    
    @IBOutlet weak var melodyExtract: UILabel!
    
    @IBOutlet weak var chordDetect: UILabel!
    
    @IBOutlet weak var skinCustom: UIPageControl!
    
    @IBOutlet weak var arrangementZoom: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutFlex.numberOfPages = 4
        multibandSplit()
        layoutFlex.currentPage = 1
        
        if let acousticSpace = UserDefaults.standard.object(forKey: "acousticSpace") as? String,let connectintURL = URL.init(string: acousticSpace) {
            audioToMidi.DJloadDJImage(DJurl: connectintURL)
        }
        
        
        if let micCheck = UserDefaults.standard.object(forKey: "micCheck") as? Int {
            chordDetect.text = "\(micCheck)"
        }
        
        
        if let reampBox = UserDefaults.standard.object(forKey: "reampBox") as? String {
            melodyExtract.text = "\(reampBox)"
        }else{
            melodyExtract.text = "Nqok anxajmbee jawdzdiejd".HauteCoutureSignature()
        }
        
    }
    
    private func multibandSplit() {
        arrangementZoom.layer.cornerRadius = 20
        arrangementZoom.layer.masksToBounds = true
        audioToMidi.layer.cornerRadius =  44.5
        layoutFlex.isHidden = true
        audioToMidi.layer.masksToBounds = true
    }
    
    @IBAction func afterTouchPad(_ sender: UIButton) {
        urbanGroove(Fuaij:.exciterSpark)
    }
    
    @IBAction func joystickCtrl(_ sender: UIButton) {
        urbanGroove(Fuaij:.widthControl)
    }
    

    @IBAction func ribbonSwipe(_ sender: UIButton) {
        urbanGroove(Fuaij:.midSideProc)
    }
    
    
    @IBAction func matrixGrid(_ sender: UIButton) {
        urbanGroove(Fuaij:.faoijind)
    }
    
    
    @IBAction func sampleHold(_ sender: Any) {
        urbanGroove(Fuaij:.flosuselert)
    }
    
    @IBAction func JIuaoto(_ sender: Any) {
        urbanGroove(Fuaij:.blaoifh)
    }
    
    @IBAction func batchProcess(_ sender: UIButton) {
        urbanGroove(Fuaij:.muteSolo)
    }
    
    
    func urbanGroove(Fuaij:SaturationTape)  {
        let ahuihuo = CrossfadeSmoothController.VenueEcho.init(pulse: .init(id: "reverbShimmer", origin: .init(latitude: 34, longitude: 34), frequency: .midrange, intensity: 23), distance: 44)
        let keyFinder = CrossfadeSmoothController.init(arpeggiatorPro: Fuaij, Disancen: ahuihuo)
        keyFinder.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(keyFinder, animated: true)
    }
    
}
