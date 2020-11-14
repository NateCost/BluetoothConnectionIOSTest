//
//  Created by Ilya Sakalou on 11/4/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

struct SplashView<Store>: View where Store: SplashViewOutput {
  let logoImage: UIImage
  var ringSpinner: RingSpinner = RingSpinner()
  
  @ObservedObject var store: Store
  @State var navigate = false
  
  init(logoImage: UIImage, store: Store) {
    self.logoImage = logoImage
    self.store = store
    let loadControl = ActivatableItemControl(itemStateUpdateHandler: ringSpinner.setState(_:))
    ringSpinner.tapAction = loadControl.activate
    self.store.bindLoadController(loadControl)
  }
  
  var body: some View {
    NavigationView {
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
        
        NavigationLink(
          destination: store.destinationView
            .navigationBarTitle("")
            .navigationBarHidden(true),
          isActive: $store.activateNavigationLink
        ) { EmptyView() }
      }
    }
    .onAppear { store.viewDidLoad() }
  }
}
// MARK: - SplashViewInput
extension SplashView: SplashViewInput {}

struct SplashView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SplashView<SplashStore>(logoImage: UIImage(named: "logo")!, store: SplashStore())
    }
  }
}
