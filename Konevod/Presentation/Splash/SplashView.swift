//
//  Created by Ilya Sakalou on 11/4/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

struct SplashView<Store>: View where Store: SplashViewOutput {
  var ringSpinner = RingSpinner()
  
  @ObservedObject var store: Store
  
  internal init(store: Store) {
    self.store = store
    store.loadController.itemStateUpdateHandler = ringSpinner.setState(_:)
    ringSpinner.tapAction = store.loadController.activate
  }
  
  var body: some View {
    NavigationView {
      VStack {
        VStack {
          Image(uiImage: UIImage(named: "logo")!)
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
    .onAppear(perform: store.viewDidAppear)
  }
}

struct SplashView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SplashView(store: SplashStore())
    }
  }
}
