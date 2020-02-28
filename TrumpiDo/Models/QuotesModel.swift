//
//  QuotesModel.swift
//  TrumpiDo
//
//  Created by Gebruiker on 26/02/2020.
//  Copyright © 2020 Gebruiker. All rights reserved.
//
import Foundation

struct Quotes: Codable {
    var messages: Messages?
}
struct Messages: Codable {
    var personalized: [String]?
    var non_personalized: [String]?
}
