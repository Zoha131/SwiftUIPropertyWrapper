//
//  Question.swift
//  SwiftUI Property Wrapper
//
//  Created by Zoha on 2/4/21.
//

import Foundation

struct Question: Decodable {
  let id: String
  let number: Int 
  let text: String
  let options: [Option]
}
