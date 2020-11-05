//
//  Created by Ilya Sakalou on 11/4/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

struct MainMenuView: View {
  var colorPalette = RegularIOSPalette()
  let start: Handler
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack(spacing: 10) {
        Button(action: {}) {
          Text("Button")
        }
        Button(action: {}) {
          Text("WOW")
        }
        Spacer()
      }
      .padding(.leading)
      .padding(.top, 60)
      Spacer()
      HStack {
        Spacer()
        VStack(alignment: .center, spacing: 20) {
          MenuButton(action: start, title: "PLAY")
          MenuButton(action: start, title: "SETTINGS")
          MenuButton(action: start, title: "ABOUT")
        }
        .frame(width: 200, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
        Spacer()
      }
      Spacer()
    }
  }
}

struct MainMenuView_Previews: PreviewProvider {
  static var previews: some View {
    MainMenuView(colorPalette: RegularIOSPalette(), start: {})
  }
}
