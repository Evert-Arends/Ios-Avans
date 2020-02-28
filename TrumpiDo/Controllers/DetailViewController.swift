//
//  DetailViewController.swift
//  TrumpiDo
//
//  Created by Gebruiker on 26/02/2020.
//  Copyright © 2020 Gebruiker. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var QuoteLabel: UILabel!
  
    var quote: String?
    
    override func viewDidLoad() {
        self.title = "Quote Detail"
        
        self.QuoteLabel.text = quote
    }
}
