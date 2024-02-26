//
//  SwitchController.swift
//  Gallery
//
//  Created by Umang Kedan on 14/12/23.
//

import UIKit

class SwitchController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var switchButton: UISwitch!
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    //    let colorArray:[UIColor] = [.red, .gray, .yellow, .orange, .green, .blue, .white]
    
    let dateOfBirth : [[[String : Any]]] = [
        [
            [
            "date":1
            ],[
        "date":2
       ],[
        "date":3
        ],[
        "date":4
    ],[
        "date":5
    ],[
        "date":6
    ],[
        "date":7
    ]
        ],
       [ [
        "month": 1
    ],[
        "month": 2
    ],[
        "month": 3
    ],[
        "month": 4
    ],[
        "month" : 5
    ]],[[
        "year": 1980
    ],[
        "year": 1981
    ],[
        "year": 1982
    ],[
        "year": 1983
    ],[
        "year": 1984
    ]]
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setSwitcher()
        setPickerView()
    }
    
    func setSwitcher() {
        switchButton.tintColor = .black
        switchButton.onTintColor = .red
        switchButton.thumbTintColor = .white
        switchButton.setOn(false, animated: false)
        switchButton.addTarget(self, action: #selector(self.handleSwitch), for: .valueChanged)
    }
    
    func setPickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    @objc func handleSwitch() {
        if switchButton.isOn == true {
            self.view.backgroundColor = .yellow
            self.pickerView.isHidden = false
        } else {
            self.view.backgroundColor = .black
            self.pickerView.isHidden = true
        }
    }
}

extension SwitchController:UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return dateOfBirth.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dateOfBirth[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if let value = dateOfBirth[component][row].values.first as? Int {
            return "\(value)"
        }
        
        return nil
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let value = dateOfBirth[component][row]["date"] as? Int {
            dateLabel.text = "Date-\(value)"
        }
        
        if let valueMonth = dateOfBirth[component][row]["month"] as? Int {
            monthLabel.text = "Month-\(valueMonth)"
        }
        if let valueYear = dateOfBirth[component][row]["year"] as? Int {
            yearLabel.text = "Year-\(valueYear)"
            
        }
        
        
    }
}
