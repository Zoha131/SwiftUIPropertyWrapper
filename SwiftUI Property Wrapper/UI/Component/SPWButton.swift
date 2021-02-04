//
//  SPWButton.swift
//  SwiftUI Property Wrapper
//
//  Created by Zoha on 2/4/21.
//

import SwiftUI

struct SPWButton: View {
  var action: () -> Void
  var title: String
  var color: Color = .button

  var body: some View {
    Button(action: action) {
      ZStack {
        Text(title)
          .fontWeight(.bold)
          .shadow(color: Color.black.opacity(0.3), radius: 1, x: 1, y: 1)
      }
      .padding(.all, 20)

      .background(
        GeometryReader { gr in
          let frame = gr.frame(in: .local)

          ZStack(alignment: .leading) {
            color

            Circle()
              .fill(Color.white.opacity(0.1))
              .frame(width: 30, height: 30)
              .offset(x: 20, y: -frame.maxY / 2.5)

            Circle()
              .fill(Color.white.opacity(0.1))
              .frame(width: 10, height: 10)
              .offset(x: frame.maxX / 3.0, y: frame.maxY / 4.5)

            Circle()
              .fill(Color.white.opacity(0.1))
              .frame(width: 60, height: 60)
              .offset(x: frame.maxX - 60, y: frame.maxY / 4.5)

          }
        }
        .clipShape(Capsule())
      )
    }
    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 5, y: 10)
  }
}

struct SPWButton_Previews: PreviewProvider {
  static var previews: some View {
    SPWButton(action: {}, title: "Start Again")
      .foregroundColor(.white)
  }
}
