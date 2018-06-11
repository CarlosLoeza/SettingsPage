//
//  NewUser.swift
//  SettingsPage
//
//  Created by Carlos on 6/5/18.
//  Copyright © 2018 Carlos. All rights reserved.
//

import UIKit

class NewUser: UIViewController, UITextFieldDelegate {

    // Variable that stores the username entered from the textField
    var savedUser: String!
    // Variable that stores the password entered from the textField
    var savedPassword: String!
    // Variable that stores the email entered from the textField
    var savedEmail: String!
    // Variable that stores the re-entered email from the textField
    var savedReEntered: String!
  
    @IBOutlet weak var User: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var Re_enterPassword: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    
    
    // This function is ran when the user clicks on the
    // create account button. It will as
    @IBAction func CreateAccount(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        // This gets the string entered in the text field
        // first param is the text field
        // second param is how we can locate it based on name
        defaults.set(User.text, forKey: "User")
        defaults.set(Password.text, forKey: "Password")
        defaults.set(Re_enterPassword.text, forKey: "Re-enterPassword")
        defaults.set(Email.text, forKey: "Email")
        defaults.synchronize()
        
    
        // This stores the user input in separate variables in order
        // to save them in the database
        savedUser = defaults.object(forKey: "User") as! String
        savedPassword = defaults.object(forKey: "Password") as! String
        savedReEntered = defaults.object(forKey: "Re-enterPassword") as! String
        savedEmail = defaults.object(forKey: "Email") as! String
        
        
//        // ** GET **
//        // This is what prepares the post call to send username and password info
//        guard let url = URL(string: "http://198.199.93.158:8000/accounts/create/") else {return}
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        
//        // This is does the post
//        let session = URLSession.shared
//        session.dataTask(with: request) { (data, response, error) in
//            if let response = response {
//                print(response)
//            }
//            
//            if let data = data {
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments
//                        ) as? [String:Any]
//                    print(json as Any)
//                } catch {
//                    print(error)
//                }
//            }
//            }.resume()
//        
//        
//     
        
        // ** POST **
        
        // Setup the parameters for the values we will pass
        let param = ["username": savedUser, "email": savedEmail, "password": savedPassword]
    
        // This is what prepares the post call to send username and password info
        guard let url = URL(string: "http://198.199.93.158:8000/accounts/create/") else {return}
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
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        User.delegate = self
        Password.delegate = self
        Re_enterPassword.delegate = self
        Email.delegate = self
        
        /*
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        */
    }
    
    /*
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
     */
    
    /*
     @objc func keyboardWillChange(notification: Notification){
     
     guard let keyboardRect = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
     return
     }
     
     
     if notification.name == Notification.Name.UIKeyboardWillShow || notification.name == Notification.Name.UIKeyboardDidChangeFrame {
     
     view.frame.origin.y = -120
     } else {
     view.frame.origin.y = 0
     
     }
     
     
     
     }
     */
    
    
    
    // Hides keyboard when user clicks outside of keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with: UIEvent?){
        self.view.endEditing(true)
    }
    
    
    // When user clicks return it proceeds to the next textField or
    // exits if it's at the passworrd textField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // If there is a textField next, then go to it once user clicks return
        // else exit out of keyboard
        if textField == User {
            Password.becomeFirstResponder()
        } else if textField == Password{
            Re_enterPassword.becomeFirstResponder()
        } else if textField == Re_enterPassword {
            Email.becomeFirstResponder()
        } else if textField == Email {
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
