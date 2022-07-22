//
//  AddProductController.swift
//  Ambar
//
//  Created by Tugay on 20.07.2022.
//

import UIKit

class AddProductController: UITableViewController {

    
    let productGroupSource = ["Meyve-Sebze", "Et-Tavuk-Balik", "Sut Urunleri", "Kahvaltilik", "Temel Gida", "Donuk-Hazir Gida", "Firin-Pastane","Icecek",]
    
    let amountType = ["Kg", "Adet"]
    
    var pcsOrkg = ""
    
    var groupPickerView: UIPickerView!
    var amountTypePickerView: UIPickerView!
    
    @IBOutlet var expireDateView : ExpDateView! {
        didSet{
            expireDateView.layer.cornerRadius = 10
            expireDateView.layer.masksToBounds = true
        }
    }
    @IBOutlet var productNameTextField: UITextField!

    @IBOutlet var amountView: AmountView!{
        didSet{
            amountView.layer.cornerRadius = 10
            amountView.layer.masksToBounds = true
            amountView.amountStepper.isEnabled = false
        }
    }

    @IBOutlet var productGroupView: ProductGroupView!{
        didSet{
            productGroupView.layer.cornerRadius = 10
            productGroupView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var photoImageView: UIImageView!{
        didSet{
            photoImageView.layer.cornerRadius = 10.0
            photoImageView.layer.masksToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGroupPicker()
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        print(amountView.amountStepper.value)
        print(expireDateView.expDatePicker.date)
        
        
    }
    @IBAction func amountChanged(_ sender: UIStepper) {
        amountView.amountLabel.text = "\(sender.value)"
        if sender.value == 0.0{
            amountView.amountLabel.text = "Miktar"
            amountView.amountLabel.textColor = .darkGray
        }else{
            amountView.amountLabel.text = "\(sender.value) \(pcsOrkg)"
            amountView.amountLabel.textColor = UIColor(named: "AnyTitleColor")
        }
    }
    @objc func closeGroupPickerView(){
        view.endEditing(true)
    }
    
    
}

extension AddProductController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == groupPickerView{
            return productGroupSource.count
        }else{
            return amountType.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == groupPickerView {
            return productGroupSource[row]
        }else{
           return amountType[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == groupPickerView{
            productGroupView.productGroupTextField.text = productGroupSource[row]
        }else{
            productGroupView.amountTypeTextField.text = amountType[row]
            pcsOrkg = amountType[row]
            amountView.amountLabel.text = "Miktar"
            amountView.amountLabel.textColor = .darkGray
            amountView.amountStepper.value = 0.0
            
            if amountType[row] == "Kg"{
                amountView.amountStepper.stepValue = 0.25
            }else{
                amountView.amountStepper.stepValue = 1.0
            }
        }
        
        if productGroupView.productGroupTextField.text ?? "" != "" && productGroupView.amountTypeTextField.text ?? "" != ""{
            amountView.amountStepper.isEnabled = true
        }
    }
    
    func createGroupPicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.closeGroupPickerView))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        productGroupView.productGroupTextField.inputAccessoryView = toolbar
        productGroupView.amountTypeTextField.inputAccessoryView = toolbar
        groupPickerView = UIPickerView()
        groupPickerView.delegate = self
        amountTypePickerView = UIPickerView()
        amountTypePickerView.delegate = self
        groupPickerView.delegate?.pickerView?(groupPickerView, didSelectRow: 0, inComponent: 0)
        amountTypePickerView.delegate?.pickerView?(amountTypePickerView, didSelectRow: 0, inComponent: 0)
        productGroupView.productGroupTextField.inputView = groupPickerView
        productGroupView.amountTypeTextField.inputView = amountTypePickerView
    }
}


