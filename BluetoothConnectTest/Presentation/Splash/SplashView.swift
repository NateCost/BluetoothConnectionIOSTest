//
//  Created by Ilya Sakalou on 11/4/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

struct SplashView: View {
  var loadController: ActivatableItem?
  var output: SplashViewOutput?
  let image: UIImage
  
  var body: some View {
    VStack {
      Image(uiImage: image)
      Text("Hello, World!")
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
