//
//  TableViewController.swift
//  TrumpiDo
//
//  Created by Gebruiker on 26/02/2020.
//  Copyright © 2020 Gebruiker. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var TrumpQuotes = Quotes()
    
    override func tableView(_ tableview: UITableView, numberOfRowsInSection section : Int) -> Int {
        return TrumpQuotes.messages?.non_personalized?.count ?? 0
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrumpQuotes", for: indexPath)
        cell.textLabel?.text = self.TrumpQuotes.messages?.non_personalized?[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        if let detailController = segue.destination as? DetailViewController {
            detailController.quote = self.TrumpQuotes.messages?.non_personalized?[self.tableView.indexPathForSelectedRow!.row]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let link = "https://api.whatdoestrumpthink.com/api/v1/quotes/"
        if let url = URL(string:link) {
            let task = URLSession.shared.dataTask(with: url){
                receivedData, response, error in
                do {
                    self.TrumpQuotes = try! JSONDecoder().decode(Quotes.self, from: receivedData!)
                    if let quote = self.TrumpQuotes.messages?.personalized {
                        for item in quote {
                            print(item)
                        }
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } else {
                        print("no messages found?")
                    }
                }
            }
            
            task.resume()
        } else {
            print("No URL recieved...")
        }
    }
    
}
