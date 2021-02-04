//
//  HomeViewModel.swift
//  SwiftUI Property Wrapper
//
//  Created by Zoha on 2/4/21.
//

import SwiftUI

class HomeViewModel: ObservableObject {
  private let answers: [String: Answer]
  private let questions: [String: Question]

  @Published private(set) var setAQuestion: Question
  @Published private(set) var setAOffsets = [CGFloat](repeating: 0.0, count: 3)
  @Published private(set) var setAOpacity = [Double](repeating: 1.0, count: 3)

  @Published private(set) var setBQuestion: Question
  @Published private(set) var setBOffsets = [CGFloat](repeating: 0.0, count: 3)
  @Published private(set) var setBOpacity = [Double](repeating: 0.0, count: 3)

  @Published private(set) var currentQsNumber = 1
  @Published private(set) var currentAnswer: Answer? = nil

  init() {
    questions = SPWRepository.loadQuestions()
      .reduce([String: Question]()) { (result, question) in
        var result = result
        result[question.id] = question
        return result
      }

    answers = SPWRepository.loadAnswers()
      .reduce([String: Answer]()){ (result, answer) in
        var result = result
        result[answer.id] = answer
        return result
      }

    setAQuestion = questions["qs1"]!
    setBQuestion = questions["qs1"]!
  }

  func select(option: Option){
    if let qeustionID = option.questionID {
      let nextQuestion = questions[qeustionID]!
      currentQsNumber = nextQuestion.number

      let tempAOpacity: Double
      let tempAOffset: CGFloat

      let tempBOpacity: Double
      let tempBOffset: CGFloat

      if setAOpacity.allSatisfy({ $0 > 0.0 }) { // Set A Visible
        setBOffsets = setBOffsets.map{_ in 300 }
        setBQuestion = nextQuestion

        tempAOpacity = 0.0
        tempAOffset = -300

        tempBOpacity = 1.0
        tempBOffset = 0
      } else { // Set B Visible
        setAOffsets = setAOffsets.map{_ in 300 }
        setAQuestion = nextQuestion

        tempAOpacity = 1.0
        tempAOffset = 0

        tempBOpacity = 0.0
        tempBOffset = -300
      }

      withAnimation(Animation.spring()) {
        setBOffsets[0] = tempBOffset
        setBOpacity[0] = tempBOpacity

        setAOffsets[0] = tempAOffset
        setAOpacity[0] = tempAOpacity
      }
      withAnimation(Animation.spring().delay(0.05)) {
        setBOffsets[1] = tempBOffset
        setBOpacity[1] = tempBOpacity

        setAOffsets[1] = tempAOffset
        setAOpacity[1] = tempAOpacity
      }
      withAnimation(Animation.spring().delay(0.1)) {
        setBOffsets[2] = tempBOffset
        setBOpacity[2] = tempBOpacity

        setAOffsets[2] = tempAOffset
        setAOpacity[2] = tempAOpacity
      }
    }

    if let answerID = option.answerID {
      withAnimation(.easeOut) {
        currentAnswer = answers[answerID]!
      }
    }
  }

  func startAgain() {
    withAnimation(.easeIn){
      setAQuestion = questions["qs1"]!
      setBQuestion = questions["qs1"]!

      currentQsNumber = 1
      currentAnswer = nil
    }
  }
}
