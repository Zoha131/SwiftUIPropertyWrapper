//
//  Line.swift
//  SwiftUI Property Wrapper
//
//  Created by Zoha on 2/4/21.
//

import SwiftUI

struct Line: View {
    var body: some View {
      GeometryReader { gr in
        let frame = gr.frame(in: .local)

        Path{ path in
          path.move(to: CGPoint(x: frame.minX, y: frame.minY))
          path.addLine(to: CGPoint(x: frame.maxX, y: frame.minY))
        }
        .stroke(style: StrokeStyle( lineWidth: 2, dash: [5]))
        .foregroundColor(.grayText)
      }
    }
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        Line()
    }
}
