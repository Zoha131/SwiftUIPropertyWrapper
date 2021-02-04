//
//  ContentView.swift
//  SwiftUI Property Wrapper
//
//  Created by Zoha on 2/4/21.
//

import SwiftUI

struct HomeScreen: View {
  @State private var showResult = false
  @ObservedObject private var viewModel = HomeViewModel()

  var body: some View {
    NavigationView {
      ZStack {
        Color.background.edgesIgnoringSafeArea(.all)

        VStack(alignment: .leading) {
          HStack(alignment:.firstTextBaseline, spacing:1) {
            Text("Question \(viewModel.currentQsNumber)")
              .font(.title)
              .fontWeight(.bold)

            Text(" / n")

            Spacer()
          }
          .foregroundColor(.grayText)

          Line().frame(height: 2)

          ZStack {
            Text(viewModel.setAQuestion.text)
              .font(.title2)
              .fontWeight(.semibold)
              .padding(.top)
              .offset(x: viewModel.setAOffsets[0])
              .opacity(viewModel.setAOpacity[0])

            Text(viewModel.setBQuestion.text)
              .font(.title2)
              .fontWeight(.semibold)
              .padding(.top)
              .offset(x: viewModel.setBOffsets[0])
              .opacity(viewModel.setBOpacity[0])
          }

          Spacer()

          ZStack {
            VStack(spacing: 30) {
              ForEach(0..<2){ id in
                let option = viewModel.setAQuestion.options[id]

                OptionView(
                  action: { viewModel.select(option: option) },
                  title: option.text
                )
                .offset(x: viewModel.setAOffsets[id + 1])
                .opacity(viewModel.setAOpacity[id + 1])
              }
            }

            VStack(spacing: 30) {
              ForEach(0..<2){ id in
                let option = viewModel.setBQuestion.options[id]

                OptionView(
                  action: { viewModel.select(option: option) },
                  title: option.text
                )
                .offset(x: viewModel.setBOffsets[id + 1])
                .opacity(viewModel.setBOpacity[id + 1])
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
        .padding(.all, 32)
      }
    }
  }
}

struct HomeScreen_Previews: PreviewProvider {
  static var previews: some View {
    HomeScreen()
  }
}
