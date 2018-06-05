//
//  InstagramSignIn.swift
//  SettingsPage
//
//  Created by Carlos on 6/5/18.
//  Copyright © 2018 Carlos. All rights reserved.
//

import UIKit

class InstagramSignIn: UIViewController, UITextFieldDelegate {

    // User text field
    @IBOutlet weak var User: UITextField!
    // Password text field
    @IBOutlet weak var Password: UITextField!
    
    
    override func viewDidLoad() {
        User.delegate = self
        Password.delegate = self
        super.viewDidLoad()
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
