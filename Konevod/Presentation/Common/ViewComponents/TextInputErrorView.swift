//
//  Created by Ilya Sakalou on 14.11.20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

struct TextInputErrorView: View {
  let title: String
  let subtitle: String
  @Binding var isPresented: Bool
  
  var body: some View {
    ZStack {
      GeometryReader { geometry in
        HStack {
          HStack {
            VStack(alignment: .leading) {
              Text(title)
                .fixedSize(horizontal: false, vertical: true)
              Text(subtitle)
                .fixedSize(horizontal: false, vertical: true)
                .font(.system(size: 11))
                .foregroundColor(Color.red)
            }
            Spacer()
            Image("alert")
              .renderingMode(.template)
              .foregroundColor(.red)
          }.padding()
        }
        .frame(
          width: geometry.size.width,
          height: geometry.size.height,
          alignment: .center
        )
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(Color.red, lineWidth: 2)
            .frame(
              width: geometry.size.width,
              height: geometry.size.height,
              alignment: .center
            )
        )
        .background(RoundedRectangle(cornerRadius: 16).fill(Color.white))
      }
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        isPresented = false
      }
    }
  }
}

struct TextInputErrorView_Previews: PreviewProvider {
  static var previews: some View {
    TextInputErrorView(title: "test@example.com", subtitle: "пользователя с таким email не существует", isPresented: .constant(false))
      .frame(width: 340, height: 60, alignment: .center)
      .background(Color.clear)
      .previewLayout(.sizeThatFits)
    
    TextInputErrorView(title: "test@example.com", subtitle: "пользователя с таким email не существует", isPresented: .constant(false))
      .frame(width: 200, height: 100, alignment: .center)
      .background(Color.gray)
      .previewLayout(.sizeThatFits)
    
    TextInputErrorView(title: "test@example.com", subtitle: "пользователя с таким email не существует", isPresented: .constant(false))
      .frame(width: 340, height: 60, alignment: .center)
      .background(Color.black)
      .previewLayout(.sizeThatFits)
      .environment(\.layoutDirection, .rightToLeft)
  }
}
