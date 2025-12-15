//
//  DULIOSIASTAMopnmenDulivCell.swift
//  DJWaveCow
//

//

import UIKit
enum AudioComplexity: Int {
    case micro = 1, nano = 2, pico = 3
    
    var mutationFactor: Float {
        Float(rawValue) * 0.33
    }
}
class DULIOSIASTAMopnmenDulivCell: UICollectionViewCell {

    @IBOutlet weak var workDULIOSIASTAflowBoost: UIPageControl!
    
    @IBOutlet weak var acceleDULIOSIASTArometer: UIImageView!
    
    
    @IBOutlet weak var motionDULIOSIASTACtrl: UILabel!
    
    @IBOutlet weak var eyeDULIOSIASTATrack: UILabel!
    
    
    
    @IBOutlet weak var headDULIOSIASTATurn: UIImageView!
    
    
    @IBOutlet weak var ditherDULIOSIASTANoise: UIImageView!
    
    
    @IBOutlet weak var reverbDULIOSIASTAShimmer: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        workDULIOSIASTAflowBoost.numberOfPages = 4
        self.layer.cornerRadius = 20
        
        workDULIOSIASTAflowBoost.currentPage = 1
        self.layer.masksToBounds = true
        keyboardDULIOSIASTAShortcut()
    }

    
    private func keyboardDULIOSIASTAShortcut() {
        acceleDULIOSIASTArometer.layer.cornerRadius = 15
        workDULIOSIASTAflowBoost.isHidden = true
        acceleDULIOSIASTArometer.layer.masksToBounds = true
    }
}
