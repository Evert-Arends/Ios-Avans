//
//  PersonalizedQuoteViewController.swift
//  TrumpiDo
//
//  Created by Gebruiker on 26/02/2020.
//  Copyright © 2020 Gebruiker. All rights reserved.
//

import UIKit

class PersonalizedQuoteViewController: UIViewController {

    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var QuoteTextField: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func GoButtonTap(_ sender: Any) {
        QuoteTextField.text = NameTextField.text
    }
    
}
