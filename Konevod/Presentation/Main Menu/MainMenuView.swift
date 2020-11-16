//
//  Created by Ilya Sakalou on 11/4/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

struct MainMenuView<
  MainMenuStore,
  TextInputViewStore
>: View where MainMenuStore: MainMenuViewOutput, TextInputViewStore: TextInputViewOutput {
  var colorPalette = RegularIOSPalette()
  let textInputView: TextInputView<TextInputViewStore>
  @ObservedObject var store: MainMenuStore
  
  var body: some View {
    ZStack {
      GeometryReader { geo in
        ZStack {
//          if $showError.wrappedValue {
          textInputView
            .frame(width: geo.size.width * 0.9, height: 60, alignment: .center)
            .background(Color.clear)
            .transition(AnyTransition.opacity.animation(.linear(duration: 0.5)))
//          }
          VStack(alignment: .leading) {
            HStack {
              HStack(spacing: 10) {
                Button(action: store.continueGame) {
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
                MenuButton(action: store.continueGame, title: "CONTINUE")
                MenuButton(action: store.newGame, title: "NEW GAME")
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
    MainMenuComposer.compose().view
  }
}
