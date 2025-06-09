//
//  MatrixDgridCell.swift
//  DJWaveCow
//

//

import UIKit

class MatrixDgridCell: UICollectionViewCell {

    @IBOutlet weak var workflowBoost: UIPageControl!
    
    @IBOutlet weak var accelerometer: UIImageView!
    
    
    @IBOutlet weak var motionCtrl: UILabel!
    
    @IBOutlet weak var eyeTrack: UILabel!
    
    
    
    @IBOutlet weak var headTurn: UIImageView!
    
    
    @IBOutlet weak var ditherNoise: UIImageView!
    
    
    @IBOutlet weak var reverbShimmer: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        workflowBoost.isHidden = true
        customAction()
    }
    func customAction()  {
        accelerometer.layer.cornerRadius = 22
        workflowBoost.currentPage = 2
        accelerometer.layer.masksToBounds = true
        workflowBoost.tintColor = .white
    }
}
