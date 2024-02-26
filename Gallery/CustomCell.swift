//
//  CustomCell.swift
//  Gallery
//
//  Created by Umang Kedan on 13/12/23.
//

import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setCellData1(name: String? , image : String?){
        imageView1.image = UIImage(named: image ?? "")
        nameLabel.text = name
    }

}
