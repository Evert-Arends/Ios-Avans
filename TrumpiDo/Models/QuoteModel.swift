//
//  QuoteModel.swift
//  TrumpiDo
//
//  Created by Gebruiker on 26/02/2020.
//  Copyright © 2020 Gebruiker. All rights reserved.
//

import Foundation

struct QuoteModel: Codable {
    var message: String?
    var nickname: String?
    var nlp_attributes: NLPAttributes
}
struct NLPAttributes: Codable {
    var pronoun: String?
    var quote_structure: [[String]]?
}
