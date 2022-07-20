//
//  AddProductController.swift
//  Ambar
//
//  Created by Tugay on 20.07.2022.
//

import UIKit

class AddProductController: UITableViewController {


    @IBOutlet var photoImageView: UIImageView!{
        didSet{
            photoImageView.layer.cornerRadius = 10.0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

   

}
