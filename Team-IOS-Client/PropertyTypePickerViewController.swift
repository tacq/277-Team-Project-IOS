//
//  PropertyTypePickerViewController.swift
//  Team-IOS-Client
//
//  Created by fangjia li on 4/24/16.
//  Copyright © 2016 张仁龙. All rights reserved.
//

import UIKit

class PropertyTypePickerViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate{

    @IBOutlet weak var propertyPicker: UIPickerView!
    let propertyTypes = ["House","Townhouse","Condo", "Apartment", "Loft"]
    var selectedProperty = ""
    @IBOutlet weak var confirmBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        propertyPicker.dataSource = self
        propertyPicker.delegate = self
        confirmBtn.addTarget(self, action: "confirmSelect", forControlEvents: .TouchUpInside)

        // Do any additional setup after loading the view.
    }

    func confirmSelect() {
        self.performSegueWithIdentifier("confirmPropertyType", sender: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        print("prepare")
        if (segue.identifier == "confirmPropertyType") {
             print(1)
            if let destination = segue.destinationViewController as? ViewController {
                 print(2)
                destination.viaPropertyType = selectedProperty
            }
        }
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return propertyTypes[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      
        selectedProperty = propertyTypes[row]
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return propertyTypes.count
    }
}
