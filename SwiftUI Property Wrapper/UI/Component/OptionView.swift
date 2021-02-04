//
//  OptionView.swift
//  SwiftUI Property Wrapper
//
//  Created by Zoha on 2/4/21.
//

import SwiftUI

struct OptionView: View {
  let action: () -> Void
  let title: String

  var body: some View {
    Button(action: action){
      HStack {
        Text(title)

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

struct OptionView_Previews: PreviewProvider {
  static var previews: some View {
    OptionView(action: {}, title: "I want to store a struct or an enum.")
  }
}
