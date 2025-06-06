//
//  WheeMoubceoloridCell.swift
//  DJWaveCow
//
//  Created by mumu on 2025/6/5.
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
