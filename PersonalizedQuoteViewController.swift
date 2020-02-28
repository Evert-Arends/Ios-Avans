//
//  PersonalizedQuoteViewController.swift
//  TrumpiDo
//
//  Created by Gebruiker on 26/02/2020.
//  Copyright © 2020 Gebruiker. All rights reserved.
//

import UIKit

class PersonalizedQuoteViewController: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var QuoteLabel: UILabel!
    @IBOutlet weak var NameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        NameTextField.text = "\(defaults.string(forKey: "Name") ?? "Name goes here")"
    }
    
    func WriteToMainThread(text: String, label:UILabel) {
        DispatchQueue.main.async {
            label.text = "\(text)"
        }
    }
    
    @IBAction func Touchy(_ sender: Any) {
        let name = NameTextField.text!
        self.defaults.set(name, forKey: "Name")
        let link = "https://api.whatdoestrumpthink.com/api/v1/quotes/personalized?q=" + name
        let encodedStr = link.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let url = URL(string:encodedStr!)
        
        guard url == url else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url!) { receivedData, response, error in
            guard error == nil else {
                return
            }
            guard let retrievedData = receivedData else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let welcome = try decoder.decode(QuoteModel.self, from: retrievedData)
                if let quote = welcome.message {
                    self.WriteToMainThread(text: "\(quote)", label: self.QuoteLabel)
                } else {
                    self.WriteToMainThread(text: "No message recieved...", label: self.QuoteLabel)
                }
                
            } catch {
                
            }
        }
        task.resume()
        
    }
}


