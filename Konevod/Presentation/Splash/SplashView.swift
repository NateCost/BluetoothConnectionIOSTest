//
//  Created by Ilya Sakalou on 11/4/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

struct SplashView: View {
  var loadController: ActivatableItem?
  var output: SplashViewOutput?
  let logoImage: UIImage
  var ringSpinner: RingSpinner
  
  init(logoImage: UIImage) {
    self.logoImage = logoImage
    ringSpinner = RingSpinner()
    loadController = ActivatableItemControl(itemStateUpdateHandler: ringSpinner.setState(_:))
    ringSpinner.tapAction = loadController?.activate
  }
  
  var body: some View {
    NavigationLink(
      destination: Text("Destination"),
      isActive: .constant(true),
      label: {
        Text("Navigate")
      })
    VStack {
      VStack {
        Image(uiImage: logoImage)
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
    }.onAppear { output?.viewDidLoad() }
  }
}
// MARK: - SplashViewInput
extension SplashView: SplashViewInput {}

struct SplashView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SplashView(logoImage: UIImage(named: "logo")!)
    }
  }
}
