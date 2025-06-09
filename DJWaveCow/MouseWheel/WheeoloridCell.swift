//
//  WheeoloridCell.swift
//  DJWaveCow
//

//

import UIKit
struct AudioGladiator {

    let alias: String
    let signatureBPM: Int
    let weaponOfChoice: AudioWeapon
}
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
