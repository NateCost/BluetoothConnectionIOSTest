//
//  Created by Ilya Sakalou on 11/4/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

struct SplashView: View {
  var loadController: ActivatableItem?
  var output: SplashViewOutput?
  let image: UIImage
  
  @State private var fillPoint = 0.0
  
  private var spinnerAnimation: Animation {
    Animation.linear(duration: 0.5).repeatForever(autoreverses: false)
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
      }
      Spacer()
      RingSpinner(fillPoint: fillPoint)
        .stroke(Color.black, lineWidth: 6.0)
        .frame(width: 40, height: 40)
        .onAppear {
          withAnimation(spinnerAnimation) {
            fillPoint = 1.0
          }
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

struct RingSpinner: Shape {
  var fillPoint: Double
  var fillDelay: Double = 0.6
  
  var animatableData: Double {
    get { fillPoint }
    set { fillPoint = newValue }
  }
  
  func path(in rect: CGRect) -> Path {
    var start = 0.0
    let end = 360.0 * fillPoint
    
    if fillPoint > fillDelay {
      start = (fillPoint - fillDelay) * 360
    } else {
      start = (1.0 - fillDelay + fillPoint) * 360
    }
    
    var path = Path()
    path.addArc(
      center: CGPoint(x: rect.size.width / 2, y: rect.size.height / 2),
      radius: rect.size.width / 2,
      startAngle: .degrees(start),
      endAngle: .degrees(end),
      clockwise: true
    )
    
    return path
  }
}
