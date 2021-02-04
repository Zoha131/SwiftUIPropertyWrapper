//
//  ContentView.swift
//  SwiftUI Property Wrapper
//
//  Created by Zoha on 2/4/21.
//

import SwiftUI

struct HomeScreen: View {
  @StateObject private var viewModel = HomeViewModel()

  var body: some View {
    NavigationView {
      ZStack {
        Color.background.edgesIgnoringSafeArea(.all)

        VStack(alignment: .leading) {
          if let answer = viewModel.currentAnswer {
            Text(answer.headline)
              .padding(.bottom)

            HStack {
              Text(answer.codeSnippet)

              Spacer()
            }
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color.grayText, lineWidth: 3)
            )

            if let description = answer.description {
              Text(description)
                .padding(.top)
            }
          } else {
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

              ZStack(alignment: .leading) {
                Text(viewModel.setAQuestion.text)
                  .font(.title2)
                  .fontWeight(.semibold)
                  .multilineTextAlignment(.leading)
                  .padding(.top)
                  .offset(x: viewModel.setAOffsets[0])
                  .opacity(viewModel.setAOpacity[0])

                Text(viewModel.setBQuestion.text)
                  .font(.title2)
                  .fontWeight(.semibold)
                  .multilineTextAlignment(.leading)
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
            }
          }

          Spacer()

          HStack {
            SPWButton(
              action: {
                if let learnMore = viewModel.currentAnswer?.learnMore,
                   let url = URL(string: learnMore){
                  UIApplication.shared.open(url)
                }
              },
              title: "Learn More",
              color: .pink
            )
            .offset(y: viewModel.currentAnswer != nil ? 0 : 200)

            Spacer()

            SPWButton(action: viewModel.startAgain, title: "Start Again")
              .offset(y: viewModel.currentAnswer != nil ? 0 : 200)
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
