//
//  NaviagationBarColor.swift
//  SwiftUI Property Wrapper
//
//  Created by Zoha on 2/5/21.
//

import SwiftUI

struct NavigationBarColor: ViewModifier {

  init(backgroundColor: Color, tintColor: Color) {
    let backgroundColor = UIColor(backgroundColor)
    let tintColor = UIColor(tintColor)

    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithOpaqueBackground()
    coloredAppearance.backgroundColor = backgroundColor
    coloredAppearance.titleTextAttributes = [.foregroundColor: tintColor]
    coloredAppearance.largeTitleTextAttributes = [.foregroundColor: tintColor]

    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().tintColor = tintColor
  }

  func body(content: Content) -> some View {
    content
  }
}

extension View {
  func navigationBarColor(backgroundColor: Color, tintColor: Color) -> some View {
    self.modifier(NavigationBarColor(backgroundColor: backgroundColor, tintColor: tintColor))
  }
}
