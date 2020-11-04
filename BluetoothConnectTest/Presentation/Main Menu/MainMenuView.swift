//
//  Created by Ilya Sakalou on 11/4/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

struct MainMenuView: View {
  var colorPalette = RegularIOSPalette()
  let start: Handler
  
  var body: some View {
    VStack {
      Button("Play", action: start)
      Button("Settings", action: start)
      Button("About", action: start)
    }
  }
}

struct MainMenuView_Previews: PreviewProvider {
  static var previews: some View {
    MainMenuView(colorPalette: RegularIOSPalette(), start: {})
  }
}
