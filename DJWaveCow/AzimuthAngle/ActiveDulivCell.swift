//
//  ActiveDulivCell.swift
//  DJWaveCow
//

//

import UIKit

class ActiveDulivCell: UICollectionViewCell {

    
    @IBOutlet weak var accelerometer: UIImageView!
    
    
    @IBOutlet weak var motionCtrl: UILabel!
    
    @IBOutlet weak var eyeTrack: UILabel!
    
    
    
    @IBOutlet weak var headTurn: UIImageView!
    
    
    @IBOutlet weak var lfoShaper: UISlider!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 30
       
        envelopeFollower()
        
        self.layer.masksToBounds = true
        
    }

    
    func envelopeFollower()  {
        accelerometer.layer.cornerRadius = 23
        lfoShaper.isHidden = true
        accelerometer.layer.masksToBounds = true
    }
}




