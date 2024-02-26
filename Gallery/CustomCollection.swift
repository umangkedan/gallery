//
//  CustomCollection.swift
//  Gallery
//
//  Created by Umang Kedan on 15/12/23.
//

import UIKit

class CustomCollection: UICollectionViewCell {

    @IBOutlet weak var imageNameLabel: UILabel!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setListCellData(name: String? , number : Int? , age: Int? , image : String?){
        widthConstraint.constant = 80
        heightConstraint.constant = 80
        nameLabel.text = name
        numberLabel.text = "Number - \(number ?? 0)"
        ageLabel.text = "Age - \(age ?? 0)"
        imageView1.image = UIImage(named: image ?? "")
        setLabel(status: false)
    }
    
    func setGridCellData(name: String? , image: String?, width:CGFloat){
        widthConstraint.constant = width
        heightConstraint.constant = width
        nameLabel.text = name
        imageView1.image = UIImage(named: image ?? "")
        setLabel(status: true)
    }
    
    func setLabel(status:Bool) {
        numberLabel.isHidden = status
        ageLabel.isHidden = status
        nameLabel.isHidden = status
        imageNameLabel.isHidden = !status
    }

}
