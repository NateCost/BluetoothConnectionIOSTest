//
//  Created by Ilya Sakalou on 11/4/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

struct SplashView: View {
  var loadController: ActivatableItem?
  var output: SplashViewOutput?
  let image: UIImage
  
  var ringSpinner: RingSpinner
  
  init(image: UIImage) {
    self.image = image
    ringSpinner = RingSpinner()
    loadController = ActivatableItemControl(itemStateUpdateHandler: ringSpinner.setState(_:))
    loadController?.action = { completion in
      print("action Triggered")
      completion?()
    }
    ringSpinner.tapAction = loadController?.activate
  }
  
  var body: some View {
    VStack {
      VStack {
        Image(uiImage: image)
          .resizable()
          .frame(width: 200, height: 200, alignment: .center)
        Text("KONEVOD")
          .font(.largeTitle)
          .bold()
      }.padding(.top, 200)
      
      Spacer()
      
      ringSpinner
        .frame(width: 40, height: 40)
        .padding(.bottom, 100)
        .onAppear {
          loadController?.activate()
        }
    }
  }
}
// MARK: - SplashViewInput
extension SplashView: SplashViewInput {}

struct SplashView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SplashView(image: UIImage(named: "logo")!)
    }
  }
}
