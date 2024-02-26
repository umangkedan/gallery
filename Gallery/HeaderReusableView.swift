//
//  HeaderReusableView.swift
//  Gallery
//
//  Created by Umang Kedan on 13/12/23.


import UIKit

class HeaderReusableView: UICollectionReusableView {
    
    @IBOutlet weak var gridButton: UIButton!
    @IBOutlet weak var nameLabelHeader: UILabel!
   
    var toggleButton = UIBarButtonItem()
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
   
}
