//
//  Created by Ilya Sakalou on 14.11.20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

struct TestView: View {
  var body: some View {
    ZStack {
      GeometryReader { (geometry : GeometryProxy) in
        VStack(spacing: 0) {
          
          Rectangle()
            .fill(Color.red)
            .frame(width: geometry.size.width, height: geometry.size.height/4)
          HStack(spacing: 0)
          {
            Rectangle()
              .fill(Color.blue)
              .frame(width: geometry.size.width/2, height: geometry.size.height/4,alignment: .center)
            Rectangle()
              .fill(Color.green)
              .frame(width: geometry.size.width/2, height: geometry.size.height/4,alignment: .center)
          }
          HStack(spacing: 0)
          {
            Rectangle()
              .fill(Color.green)
              .frame(width: geometry.size.width/2, height: geometry.size.height/4,alignment: .center)
            Rectangle()
              .fill(Color.blue)
              .frame(width: geometry.size.width/2, height: geometry.size.height/4,alignment: .center)
          }
          Rectangle()
            .fill(Color.red)
            .frame(width: geometry.size.width, height: geometry.size.height/4)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
      }
    }
  }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
