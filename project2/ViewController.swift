//
//  ViewController.swift
//  project2
//
//  Created by JIN on 07/08/2019.
//  Copyright © 2019 sy. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var idField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let userId: String = UserInformation.shared.id {
            idField.text = userId
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

