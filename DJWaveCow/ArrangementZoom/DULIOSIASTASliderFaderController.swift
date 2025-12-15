//
//  DULIOSIASTASliderFaderController.swift
//  DJWaveCow
//

//

import UIKit

class DULIOSIASTASliderFaderController: UIViewController {

    @IBOutlet weak var DULIOSIASTAdfans: UIButton!
    
    
    @IBOutlet weak var DULIOSIASTAmyfoll: UIButton!
    
    
    @IBOutlet weak var DULIOSIASTAmyblaoc: UIButton!
    
    @IBOutlet weak var DULIOSIASTApos: UILabel!
    
    @IBOutlet weak var DULIOSIASTAlayoutFlex: UIPageControl!
    
    @IBOutlet weak var audioToMidi: UIImageView!
    
    @IBOutlet weak var melodyExtract: UILabel!
    
    @IBOutlet weak var chordDetect: UILabel!
    
    @IBOutlet weak var skinCustom: UIPageControl!
    
    @IBOutlet weak var DULIOSIASTAarrangementZoom: UIStackView!
    
    @IBOutlet weak var DULIOSIASTAcoser: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DULIOSIASTAdfans.setTitle("Fcamnas".HauteCoutureSignature(), for: .normal)
        DULIOSIASTAmyfoll.setTitle("Fmoplylrozwyienngms".HauteCoutureSignature(), for: .normal)
        DULIOSIASTAmyblaoc.setTitle("Bqlcapcwkcllidskt".HauteCoutureSignature(), for: .normal)
        DULIOSIASTApos.text = "PyOvSsT".HauteCoutureSignature()
        
        DULIOSIASTAcoser.text = "Nfoi xruefcwotrtdys".HauteCoutureSignature()
        
        DULIOSIASTAlayoutFlex.numberOfPages = 4
        multibandSplit()
        DULIOSIASTAlayoutFlex.currentPage = 1
        
        if let acousticSpace = UserDefaults.standard.object(forKey: "acousticSpace") as? String,let connectintURL = URL.init(string: acousticSpace) {
            DULIOSIASTABeatImageLoader.DULIOSIASTAloadDULIOSIASTAImage(DULIOSIASTAfrom: acousticSpace, DULIOSIASTAinto: audioToMidi)
            
          
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
        DULIOSIASTAarrangementZoom.layer.cornerRadius = 20
        DULIOSIASTAarrangementZoom.layer.masksToBounds = true
        audioToMidi.layer.cornerRadius =  44.5
        DULIOSIASTAlayoutFlex.isHidden = true
        audioToMidi.layer.masksToBounds = true
    }
    
    @IBAction func afterTouchPad(_ sender: UIButton) {
        urbanGroove(Fuaij:.DULIOSIASTAexciterSpark)
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
        let ahuihuo = DULIOSIASTACrossfadeSmoothController.VenueEcho.init(pulse: .init(DULIOSIASTAid: "reverbShimmer", DULIOSIASTAorigin: .init(latitude: 34, longitude: 34), DULIOSIASTAfrequency: .midrange, DULIOSIASTAintensity: 23), distance: 44)
        let keyFinder = DULIOSIASTACrossfadeSmoothController.init(arpeggiatorPro: Fuaij, Disancen: ahuihuo)
        keyFinder.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(keyFinder, animated: true)
    }
    
}
