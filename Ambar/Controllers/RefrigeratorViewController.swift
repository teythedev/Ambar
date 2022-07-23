//
//  ViewController.swift
//  Ambar
//
//  Created by Tugay on 20.07.2022.
//

import UIKit

class RefrigeratorViewController: UIViewController {

    @IBOutlet var empytRefrigeratorView : UIView!
    @IBOutlet var productInRefrigeratorTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        productInRefrigeratorTableView.backgroundView = empytRefrigeratorView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.addProductModalSegue {
            if let _ = segue.destination as? AddProductController {
                print("heello")
            }
        }
    }
    
    @IBAction func close(segue: UIStoryboardSegue){
        dismiss(animated: true)
    }


}

