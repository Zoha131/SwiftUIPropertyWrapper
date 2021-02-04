//
//  Answer.swift
//  SwiftUI Property Wrapper
//
//  Created by Zoha on 2/4/21.
//

import Foundation

struct Answer: Decodable {
  let id: String
  let headline: String
  let codeSnippet: String
  let description: String?
  let shortDescription: String
  let learnMore: String
}
