//
//  SPWRepository.swift
//  SwiftUI Property Wrapper
//
//  Created by Zoha on 2/4/21.
//

import Foundation

class SPWRepository {
  static func loadAnswers() -> [Answer] {
    guard let url = Bundle.main.url(
      forResource: "answers",
      withExtension: "json"
    ) else {
      fatalError("Unable to load answers from bundle")
    }

    do {
      let data = try Data(contentsOf: url)
      let decoder = JSONDecoder()
      let answers = try decoder.decode([Answer].self, from: data)

      return answers
    } catch {
      fatalError(error.localizedDescription)
    }

  }

  static func loadQuestions() -> [Question] {
    guard let url = Bundle.main.url(
      forResource: "questions",
      withExtension: "json"
    ) else {
      fatalError("Unable to load questions from bundle")
    }

    do {
      let data = try Data(contentsOf: url)
      let decoder = JSONDecoder()
      let questions = try decoder.decode([Question].self, from: data)

      return questions
    } catch {
      fatalError(error.localizedDescription)
    }
  }
}
