//
//  Created by Ilya Sakalou on 11/4/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

struct MainMenuView: View {
  var colorPalette = RegularIOSPalette()
  let start: Handler
  
  var body: some View {
    VStack(spacing: 20) {
      MenuButton(action: start, title: "PLAY")
      MenuButton(action: start, title: "SETTINGS")
      MenuButton(action: start, title: "ABOUT")
    }
  }
}

struct MainMenuView_Previews: PreviewProvider {
  static var previews: some View {
    MainMenuView(colorPalette: RegularIOSPalette(), start: {})
  }
}

struct MenuButton: View {
  var action: Handler
  var title: String
  
  var body: some View {
    Button(action: action) {
      Text(title)
        .foregroundColor(.white)
        .fontWeight(.medium)
        .font(.title)
    }
    .frame(width: 200, height: 60, alignment: .center)
    .background(Color.black)
    .cornerRadius(10.0)
  }
}
