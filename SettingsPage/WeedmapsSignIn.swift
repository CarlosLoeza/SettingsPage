//
//  WeedmapsSignInViewController.swift
//  SettingsPage
//
//  Created by Carlos on 6/4/18.
//  Copyright © 2018 Carlos. All rights reserved.
//

import UIKit

class WeedmapsSignIn: UIViewController, UITextFieldDelegate {

    // User textField
    @IBOutlet weak var User: UITextField!
    // Password textField
    @IBOutlet weak var Password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        User.delegate = self
        Password.delegate = self
        
       
    }
    
    // Hides keyboard when user clicks outside of keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with: UIEvent?){
        self.view.endEditing(true)
    }
    
    // When user clicks return it proceeds to the next textField or
    // exits if it's at the passworrd textField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == User {
            Password.becomeFirstResponder()
        } else if textField == Password{
            textField.resignFirstResponder()
        }
        return true
    }

   
}
