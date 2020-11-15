//
//  Created by Ilya Sakalou on 11/4/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

struct MainMenuView: View {
  var colorPalette = RegularIOSPalette()
  let start: Handler
  @State private var showError = true
  
  var body: some View {
    ZStack {
      GeometryReader { geo in
        ZStack {
          if $showError.wrappedValue {
            TextInputView(placeholder: "Please enter email")
            .frame(width: geo.size.width * 0.9, height: 60, alignment: .center)
            .background(Color.clear)
            .transition(AnyTransition.opacity.animation(.linear(duration: 0.5)))
          }
          VStack(alignment: .leading) {
            HStack {
              HStack(spacing: 10) {
                Button(action: { showError = true }) {
                  Text("Button")
                }
                Button(action: {}) {
                  Text("WOW")
                }
              }.padding(.leading)
              
              Spacer()
              
              HStack(spacing: 10) {
                Button(action: {}) {
                  Text("Button")
                }
                Button(action: {}) {
                  Text("WOW")
                }
              }.padding(.trailing)
            }
            .padding(.top, 60)
            
            Spacer()
            
            HStack {
              Spacer()
              VStack(alignment: .center, spacing: 20) {
                MenuButton(action: start, title: "CONTINUE")
                MenuButton(action: start, title: "NEW GAME")
              }
              .frame(width: 200, height: UIScreen.main.bounds.height * 0.2, alignment: .center)
              Spacer()
            }.padding(.bottom, UIScreen.main.bounds.height * 0.1)
          }
        }
      }
    }
  }
}

struct MainMenuView_Previews: PreviewProvider {
  static var previews: some View {
    MainMenuView(colorPalette: RegularIOSPalette(), start: {})
  }
}
