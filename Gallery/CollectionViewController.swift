//
//  CollectionViewController.swift
//  Gallery
//
//  Created by Umang Kedan on 13/12/23.
//

import UIKit

class CollectionViewController: UIViewController {
//    @IBOutlet weak var tableView1: UITableView!
    
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var gridButton: UIButton!
    let customLayout = UICollectionViewFlowLayout()
    
    var userList :[[[String : Any]]] =
    [
        [
            [
                "name":"Umang",
                "image": "pokemon",
                "number": 1,
                "age" : 22
                
            ],
            [
                "name": "Riya",
                "image": "pikachu",
                "number": 2,
                "age" : 24
            ],
            [
                
                "name":"Geetanshu",
                "image": "shinchan",
                "number": 3,
                "age" : 28
            ] ,
            [
                "name":"Inderpreet",
                "image": "charlizard",
                "number": 4,
                "age" : 20
            ],
            [
                "name":"Riyan",
                "image": "pokemon2",
                "number": 9,
                "age" : 22
                
            ],
            [
                "name":"Rahul",
                "image": "snorlex",
                "number": 8,
                "age" : 29
            ]
        ],
        [
            [ "name":"Rose",
              "image": "rose",
              "number": 9,
              "age" : 21
            ],
            [
                "name":"Sinal",
                "image": "peppa",
                "number": 3,
                "age" : 28
            ],
            [
                
                "name":"Mohak",
                "image": "bulbasor",
                "number": 1,
                "age" : 22
            ] ,
            [
                "name":"Nita",
                "image": "charlizard",
                "number": 1,
                "age" : 22
            ],
            [
                "name":"Sonia",
                "image": "pokemon2",
                "number": 1,
                "age" : 22
                
            ],
            [
                "name":"Pina",
                "image": "snorlex",
                "number": 1,
                "age" : 22
                
            ]
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
//        tableView1.isHidden = true
        setupButton()
    }
    
    func setUpView(){
        collectionView1.delegate = self
        collectionView1.dataSource = self
        collectionView1.register(UINib(nibName: "CustomCell", bundle: .main), forCellWithReuseIdentifier: "custom")
        collectionView1.register(UINib(nibName: "CustomCollection", bundle: .main), forCellWithReuseIdentifier: "user")
       
        
        customLayout.minimumInteritemSpacing = 20
        customLayout.minimumLineSpacing = 20
        customLayout.sectionInset = .init(top: 10, left: 0, bottom: 10, right: 0)
        customLayout.headerReferenceSize = .init(width:collectionView1.frame.width, height: 50)
        customLayout.footerReferenceSize = .init(width: collectionView1.frame.width, height: 50)
        
        collectionView1.collectionViewLayout = customLayout
        
        collectionView1.register(UINib(nibName: "HeaderReusableView", bundle: .main),forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView1.register(UINib(nibName: "FooterReusableView", bundle: .main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer")
        
    }
    func setupButton(){
        gridButton.setTitle("Grid", for: .normal)
        gridButton.setTitle("List", for: .selected)
        gridButton.addTarget(self, action: #selector(changeLayout(sender:)), for: .touchUpInside)
    }

    @objc func changeLayout(sender:UIButton){
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected == true {
            customLayout.scrollDirection = .horizontal
            customLayout.minimumInteritemSpacing = 0
            customLayout.minimumLineSpacing = 0
            customLayout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
            customLayout.headerReferenceSize = .init(width:0, height: 0)
            customLayout.footerReferenceSize = .init(width: 0, height: 0)
            collectionView1.isPagingEnabled = true
        } else {
            customLayout.scrollDirection = .vertical
            customLayout.minimumInteritemSpacing = 20
            customLayout.minimumLineSpacing = 20
            customLayout.sectionInset = .init(top: 10, left: 0, bottom: 10, right: 0)
            customLayout.headerReferenceSize = .init(width:collectionView1.frame.width, height: 50)
            customLayout.footerReferenceSize = .init(width: collectionView1.frame.width, height: 50)
            collectionView1.isPagingEnabled = false
        }
        
        collectionView1.reloadData()
    }
}

extension CollectionViewController : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userList[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let data = userList[indexPath.section][indexPath.item]
        let name = data["name"] as? String
        let image = data["image"] as? String
        let number = data["number"] as? Int
        let age = data["age"] as? Int
        
        guard let cell = collectionView1.dequeueReusableCell(withReuseIdentifier: "user", for: indexPath) as? CustomCollection else {
            return UICollectionViewCell()
        }
//        guard let cell1 = collectionView1.dequeueReusableCell(withReuseIdentifier: "custom", for: indexPath) as? CustomCell else{
//            return UICollectionViewCell()
//            
//        }
        
        if gridButton.isSelected == true {
            let width = collectionView1.frame.width//(collectionView1.frame.width - 20 ) / 2
            cell.setGridCellData(name: name, image: image, width: width)
            return cell
        } else {
            cell.setListCellData(name: name, number: number, age: age, image: image)
            return cell
        }
}
  
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        userList[section].count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "table", for: indexPath) as?
//                TableViewCell else {
//            return UITableViewCell()
//        }
//        if let name = userList[indexPath.section][indexPath.item]["name"] as? String,
//           let imageName = userList[indexPath.section][indexPath.item]["image"] as? String,
//           let image = UIImage(named: imageName) {
//            cell.setCellData(name: name, image: image)
//        } else {
//            cell.setCellData(name: nil, image: nil)
//        }
//        return cell
//    }
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 2
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            if gridButton.isSelected == true {
                let width = collectionView1.frame.width //(collectionView1.frame.width - 20 ) / 2
                return CGSize(width: width, height: width + 20)
                
            } else {
                let width = collectionView1.frame.width
                return CGSize(width: width, height: 90)
            }
            
            
        }
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as? HeaderReusableView else{
                    return UICollectionReusableView()
                }
                header.nameLabelHeader.text = "Section \(indexPath.section + 1)"
                
                return header
                
            case UICollectionView.elementKindSectionFooter :
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer", for: indexPath) as? FooterReusableView else {
                    return UICollectionReusableView()
                }
                return footer
                
            default:
                return UICollectionReusableView()
            }
            
        }
        
    }
    

