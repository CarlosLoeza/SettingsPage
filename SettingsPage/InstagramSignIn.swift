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
    // Check box button
    @IBOutlet weak var unCheckedBox: UIButton!
    
    // Variable that stores the username entered from the textField
    var savedUser: String!
    // Variable that remembers the user's name
    var rememberUser: String!
    // Variable that stores the password entered from the textField
    var savedPassword: String!
    
    // Variables hold the image of checked/unchecked box
    var checkboxPic = UIImage(named: "checked")
    var uncheckedboxPic = UIImage(named: "unchecked")
    // Has the box been clicked
    var isBoxClicked: Bool!
    
   
    
    
    
    override func viewDidLoad() {
        User.delegate = self
        Password.delegate = self
        isBoxClicked = false
        
        super.viewDidLoad()
    }
    
    
    
    // This function is made for the Remember user box.
    // It will check/uncheck the box when it is clicked
    @IBAction func clickBox(_ sender: Any) {
        
        // If statement checks what state it's currently at turns it to
        // the opposite state once clicked
        if isBoxClicked == true {
            isBoxClicked = false
        } else {
            isBoxClicked = true
        }
        
        // Once the state of box has been updated it also updates
        // the status of the photo
        if isBoxClicked == true {
            unCheckedBox.setImage(checkboxPic, for: UIControlState.normal)
        } else {
            unCheckedBox.setImage(uncheckedboxPic, for: UIControlState.normal)
        }
    }
    
    // ** Question: what if user doesnt want to save username? Do we still pass
    //    param?
    // Code it so we pass 3 param when clicked
    // if else statement to pass 2 or 3 param
    
    
    // This function gets the username/email and password
    // entered and uses it to sign in
    @IBAction func SignIn(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        // This gets the string entered in the text field
        // first param is the text field
        // second param is how we can locate it based on name
        defaults.set(User.text, forKey: "User")
        defaults.set(Password.text, forKey: "Password")
        
        // This stores the user input in separate variables in order
        // to save them in the database
        savedUser = defaults.object(forKey: "User") as! String
        rememberUser = defaults.object(forKey: "User") as! String
        savedPassword = defaults.object(forKey: "Password") as! String
        
        // Setup the parameters for the values we will pass
        let param = ["username": rememberUser, "igusername":
            savedUser, "igpassword": savedPassword]
        
         print("User: \(rememberUser), Iguser: \(savedUser), password: \(savedPassword)")
        
        // This is what prepares the post call to send username and password info
        guard let url = URL(string: "http://198.199.93.158:8000/accounts/9/settings/ig") else {return}
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
                    print(json as Any)
                } catch {
                    print(error)
                }
            }
            }.resume()
        
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
