//
//  SecondViewController.swift
//  Math
//
//  Created by Алексей on 29/08/2017.
//  Copyright © 2017 Алексей. All rights reserved.
//

import UIKit

var startNumber = arc4random_uniform(100-10+1) + 10;
var endNumber   = arc4random_uniform(100-10+1) + 10;
var actionSelectedNum = 0;

class SecondViewController: UIViewController , UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
//    var prevPickerViewArray = "";

    @IBOutlet weak var startNumberTextField: UITextField!
    @IBOutlet weak var endNumberTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var labelPickerView: UILabel!
    
    @IBAction func doneButtonNumbers(_ sender: Any) {
        startNumber = UInt32(startNumberTextField.text!)!;
        endNumber   = UInt32(endNumberTextField  .text!)!;
        startNumberTextField.text = "";
        endNumberTextField.text = "";
        self.view.endEditing(true)
    }
    
    let pickerViewArray = [ "Сложение" ,  "Вычитание" , "Умножение"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewArray[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewArray.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        actionSelectedNum = row;
        labelPickerView.text = "Сейчас выбрано : " + pickerViewArray[row];
//        prevPickerViewArray = pickerViewArray[row];
    }
    
    
    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        <#code#>
//    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whatToShowInPickerView();
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    
    func whatToShowInPickerView(){
        if actionSelectedNum == 0 {
            labelPickerView.text = "Сейчас выбрано : Сложение";

        }
        if actionSelectedNum == 1 {
            labelPickerView.text = "Сейчас выбрано : Вычитание";

        }
        if actionSelectedNum == 2 {
            labelPickerView.text = "Сейчас выбрано : Умножение";

        }
    }
}
