//
//  AllWrapperScreen.swift
//  SwiftUI Property Wrapper
//
//  Created by Zoha on 2/5/21.
//

import SwiftUI

struct AllWrapperScreen: View {
  @State private var allWrappers = SPWRepository.loadAnswers()

  var body: some View {
    ZStack {
      Color.background.edgesIgnoringSafeArea(.all)

      ScrollView {
        Color.border
          .frame(height: 1)
          .padding(.leading)

        LazyVStack(alignment: .leading){
          ForEach(allWrappers, id: \.id){ wrapper in
            VStack(alignment: .leading) {
              Button {
                if let url = URL(string: wrapper.learnMore){
                  UIApplication.shared.open(url)
                }
              } label: {
                Image(systemName: "\(wrapper.id.dropFirst(3)).circle")
                  .foregroundColor(.grayText)

                Text(wrapper.shortDescription)
                  .foregroundColor(.white)
                  .listRowBackground(Color.background)
                  .padding()

              }
              .padding(.leading, 32)

              Color.border
                .frame(height: 1)
                .padding(.leading)

            }
          }
        }
      }
    }
  }
}

struct AllWrapperScreen_Previews: PreviewProvider {
  static var previews: some View {
    Group{
      AllWrapperScreen()

      List{
        ForEach(SPWRepository.loadAnswers(), id: \.id){ wrapper in
          VStack(alignment: .leading) {
            Text(wrapper.shortDescription)
              .padding()

          }
        }
      }
    }
  }
}
