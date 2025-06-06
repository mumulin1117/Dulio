//
//  WheeoloridCell.swift
//  DJWaveCow
//
//  Created by mumu on 2025/6/5.
//

import UIKit

class WheeoloridCell: UICollectionViewCell {
    
    @IBOutlet weak var accelerometer: UIImageView!
    
    
    @IBOutlet weak var motionCtrl: UILabel!
    
   
    
    
    @IBOutlet weak var lfoShaper: UIStepper!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        envelopeFollower()
    }

    
    func envelopeFollower()  {
        accelerometer.layer.cornerRadius = 15
        lfoShaper.isHidden = true
        accelerometer.layer.masksToBounds = true
    }
   

}
