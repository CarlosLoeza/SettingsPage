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

        User.delegate = self
        Password.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
