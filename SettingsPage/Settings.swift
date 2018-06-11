//
//  Settings.swift
//  SettingsPage
//
//  Created by Carlos on 6/5/18.
//  Copyright © 2018 Carlos. All rights reserved.
//

import UIKit

class Settings: UITableViewController {

    // Auto-post deals switch in settings
    @IBAction func dealsSwitch(_ sender: UISwitch) {
    }
    
    
    // Auto-post memes switch in settings
    @IBAction func memesSwitch(_ sender: UISwitch) {
    }
    /*
        guard let url = URL(string: "http://198.199.93.158:8000/testAPI/") else { return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)
            }
            
        }.resume()
*/
        
        
        
        
        
        
        /*
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.url = NSURL(string: url) as! URL
        request.httpMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue(), completionHandler:{ (response:URLResponse?, data: NSData?, error: NSError?) -> Void in
            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
            
            if (jsonResult != nil) {
                // process jsonResult
            } else {
                // couldn't load JSON, look at error
            }
            
            
        })
    
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue(), completionHandler: (response: URLResponse, data: NSData, error: NSError)
        
        }
    */
    
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
