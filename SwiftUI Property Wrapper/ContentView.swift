//
//  ContentView.swift
//  SwiftUI Property Wrapper
//
//  Created by Zoha on 2/4/21.
//

import SwiftUI

struct ContentView: View {
  @State private var showResult = false
  @State private var currentQsNumber = 1

  @State private var previousQs = ""
  @State private var currentQs = "Are you storing a struct, an enum, or a class?"

  @State private var previousOptions = [String]()
  @State private var currentOptions = [String]()

  @State private var previousOffsets = [Double](repeating: 0.0, count: 3)
  @State private var currentOffsets = [Double](repeating: 0.0, count: 3)

  @State private var previousOpacity = [Double](repeating: 0.0, count: 3)
  @State private var currentOpacity = [Double](repeating: 0.0, count: 3)

  var body: some View {
    NavigationView {
      ZStack {
        Color.background.edgesIgnoringSafeArea(.all)

        VStack(alignment: .leading) {
          HStack(alignment:.firstTextBaseline, spacing:1) {
            Text("Question \(currentQsNumber)")
              .font(.title)
              .fontWeight(.bold)

            Text(" / n")

            Spacer()
          }
          .foregroundColor(.grayText)

          Line().frame(height: 2)

          Text(currentQs)
            .font(.title2)
            .fontWeight(.semibold)
            .padding(.top)

          Spacer()

          VStack(spacing: 30) {
            ForEach(0..<2){ id in
              Button {

              } label: {
                HStack {
                  Text("I want to store a struct or an enum.")

                  Spacer()
                }
                .padding()
                .background(
                  RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(Color.border, lineWidth: 3)
                )
              }
            }
          }
          .padding(.bottom, 48)

          HStack {
            Spacer()

            SPWButton(action: {}, title: "Start Again")
              .offset(y: showResult ? 0 : 200)

            Spacer()
          }
        }
        .foregroundColor(.white)
        .padding(.horizontal, 32)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
