//
//  WheeMoubceoloridCell.swift
//  DJWaveCow
//

//

import UIKit

class WheeMoubceoloridCell: UICollectionViewCell {
    
    @IBOutlet weak var accelerometer: UIImageView!
    
    
    @IBOutlet weak var motionCtrl: UILabel!
    
    @IBOutlet weak var eyeTrack: UILabel!
    
    
    
    @IBOutlet weak var headTurn: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        envelopeFollower()
    }

    
    func envelopeFollower()  {
        accelerometer.layer.cornerRadius = 35
   
        accelerometer.layer.masksToBounds = true
    }
}
