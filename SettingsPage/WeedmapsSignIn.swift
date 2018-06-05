//
//  WeedmapsSignInViewController.swift
//  SettingsPage
//
//  Created by Carlos on 6/4/18.
//  Copyright © 2018 Carlos. All rights reserved.
//

import UIKit

class WeedmapsSignIn: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    
    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userName {
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
