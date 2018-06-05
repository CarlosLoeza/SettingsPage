//
//  ViewController.swift
//  SettingsPage
//
//  Created by Carlos on 6/2/18.
//  Copyright © 2018 Carlos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Username textField
    @IBOutlet weak var User: UITextField!
    // Password textField
    @IBOutlet weak var Password: UITextField!
    
    
    override func viewDidLoad() {
        
        User.delegate = self
        Password.delegate = self
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with: UIEvent?){
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == User {
             Password.becomeFirstResponder()
        } else if textField == Password{
            textField.resignFirstResponder()
        }
        return true
    }
        
        // Do any additional setup after loading the view, typically from a nib.
}

    



