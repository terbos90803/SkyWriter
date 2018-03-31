//
//  ControlsViewController.swift
//  SkyWriter
//
//  Created by Terry Wells on 3/10/18.
//  Copyright © 2018 Terry Wells. All rights reserved.
//

import UIKit
import CoreBluetooth

class ControlsViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    // UI
    @IBOutlet weak var presetTextUI: UITextField!
    @IBOutlet weak var customTextUI: UITextField!
    @IBOutlet weak var customFGUI: UITextField!
    @IBOutlet weak var customBGUI: UITextField!
    //Data
    var peripheral: CBPeripheral!
    var presetPicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presetPicker = UIPickerView()
        presetPicker.delegate = self
        presetPicker.dataSource = self
        
        presetTextUI.delegate = self
        presetTextUI.inputView = presetPicker
        customTextUI.delegate = self
        customFGUI.delegate = self
        customBGUI.delegate = self
        presetPicker.delegate = self
        presetPicker.dataSource = self
        subscribeNotifications()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func subscribeNotifications() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Notify"), object: nil , queue: nil){
            notification in
            self.presetTextUI.text = String(presetValue)
            self.customTextUI.text = customMsgASCIIValue as String
            self.customFGUI.text = customFGASCIIValue as String
            self.customBGUI.text = customBGASCIIValue as String
        }
    }
    
    func hideKeyboard() {
        customTextUI.resignFirstResponder()
        customFGUI.resignFirstResponder()
        customBGUI.resignFirstResponder()
    }

    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Int(numPresetsValue)
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    // Catpure the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        presetTextUI.text = String(row)
        presetValue = UInt8(row)
        writeValue(presetValue, characteristic: presetCharacteristic!)
        self.view.endEditing(true)
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch (textField)
        {
        case customTextUI:
            writeValue(textField.text!, characteristic: customMsgCharacteristic!)
        case customFGUI:
            writeValue(textField.text!, characteristic: customFGCharacteristic!)
        case customBGUI:
            writeValue(textField.text!, characteristic: customBGCharacteristic!)
        default:
            // not one of ours
            print("Unrecognized Text field \(textField)")
        }
    }
    
    // Write functions
    func writeValue(_ data: String, characteristic: CBCharacteristic)
    {
        let valueString = (data as NSString).data(using: String.Encoding.utf8.rawValue)
        //change the "data" to valueString
        peripheral.writeValue(valueString!, for: characteristic, type: CBCharacteristicWriteType.withResponse)
    }
    
    func writeValue(_ val: UInt8, characteristic: CBCharacteristic)
    {
        var val = val
        let ns = NSData(bytes: &val, length: MemoryLayout<UInt8>.size)
        peripheral.writeValue(ns as Data, for: characteristic, type: CBCharacteristicWriteType.withResponse)
    }

}

