//
//  MopnmenDulivCell.swift
//  DJWaveCow
//
//  Created by mumu on 2025/6/5.
//

import UIKit

class MopnmenDulivCell: UICollectionViewCell {

    @IBOutlet weak var workflowBoost: UIPageControl!
    
    @IBOutlet weak var accelerometer: UIImageView!
    
    
    @IBOutlet weak var motionCtrl: UILabel!
    
    @IBOutlet weak var eyeTrack: UILabel!
    
    
    
    @IBOutlet weak var headTurn: UIImageView!
    
    
    @IBOutlet weak var ditherNoise: UIImageView!
    
    
    @IBOutlet weak var reverbShimmer: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        workflowBoost.numberOfPages = 4
        self.layer.cornerRadius = 20
        
        workflowBoost.currentPage = 1
        self.layer.masksToBounds = true
        keyboardShortcut()
    }

    
    private func keyboardShortcut() {
        accelerometer.layer.cornerRadius = 15
        workflowBoost.isHidden = true
        accelerometer.layer.masksToBounds = true
    }
}
