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
    // Variable that stores the username entered in the textField
    var savedUser: String!
    // Variable that stores the password entered in the textField
    var savedPassword: String!
    
    override func viewDidLoad() {
        
        User.delegate = self
        Password.delegate = self
        super.viewDidLoad()
    }
    
    // When user clicks return it proceeds to the next textField or
    // exits if it's at the last textField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == User {
            Password.becomeFirstResponder()
        } else if textField == Password{
            textField.resignFirstResponder()
        }
        return true
    }
    
    // This function passes the text in the User textField and
    // saves it in savedUser
    func textFieldShouldReturn(User: UITextField) -> Bool {
        savedUser = User.text
        User.resignFirstResponder()
        return false
    }
    
    
    // This function passes the text in the Password textField and
    // saves it in savedPassword
    func textFieldShouldReturn(Password: UITextField) -> Bool {
        savedPassword = User.text
        Password.resignFirstResponder()
        return false
    }
    

    
    @IBAction func LogIn(_ sender: Any) {
        
        // Setup the parameters for the values we will pass
        let param = ["username": savedUser, "password": savedPassword]
        
        // This is what prepares the post call to send username and password info
        guard let url = URL(string: "http://198.199.93.158:8000/login/") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: param, options: []) else {return}
        request.httpBody = httpBody
        
        // This is does the post 
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments
                    ) as? [String:Any]
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
        
    }
    
    
  
    
    /*
    override func touchesBegan(_ touches: Set<UITouch>, with: UIEvent?){
        self.view.endEditing(true)
    }
    */
    

    
}

    



