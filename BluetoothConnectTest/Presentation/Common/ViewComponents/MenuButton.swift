//
//  Created by Ilya Sakalou on 11/5/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

struct MenuButton: View {
  var action: Handler
  var title: String
  
  var body: some View {
    Button(action: action) {
      Text(title)
        .foregroundColor(.white)
        .fontWeight(.medium)
        .font(.title)
        .padding(.all)
    }
    .frame(
      minWidth: 0, idealWidth: 100, maxWidth: .infinity,
      minHeight: 0, idealHeight: 100, maxHeight: .infinity,
      alignment: .center
    )
    .background(Color.black)
    .cornerRadius(10.0)
  }
}

struct MenuButton_Previews: PreviewProvider {
  static var previews: some View {
    MenuButton(action: {}, title: "TEST")
      .frame(width: 200, height: 60, alignment: .center)
      .previewLayout(.sizeThatFits)
  }
}
