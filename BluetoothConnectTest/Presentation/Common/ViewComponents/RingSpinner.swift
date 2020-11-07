//
//  Created by Ilya Sakalou on 11/4/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

enum RunnableState {
  case running
  case stopped
}

protocol Runnable {
  var state: RunnableState { get set }
}

struct RingSpinner: View, Runnable {
  @State var state: RunnableState = .stopped
  
  private var spinnerAnimation: Animation {
    Animation.linear(duration: 0.5).repeatForever(autoreverses: false)
  }
  
  private var noAnimation: Animation {
    Animation.linear(duration: 0.2).repeatCount(0)
  }
  
  var body: some View {
    RingSpinnerShape(state: $state)
  }
}

struct RingSpinnerShape: Shape {
  struct Constants {
    static let totalDegree = 360.0
  }
  
  @Binding var state: RunnableState {
    didSet { handleState(state) }
  }
  
  var fillPoint: Double = 1.0
  var fillDelay: Double = 0.5
  
  var animatableData: Double {
    get { fillPoint }
    set { fillPoint = newValue }
  }
  
  private func handleState(_ state: RunnableState) {
    switch state {
      case .running: ()
      case .stopped: ()
    }
  }
  
  func path(in rect: CGRect) -> Path {
    var start = 0.0
    let end = Constants.totalDegree * fillPoint
    
    if fillPoint > fillDelay {
      start = (fillPoint - fillDelay) * Constants.totalDegree
    } else {
      start = (1.0 - fillDelay + fillPoint) * Constants.totalDegree
    }
    
    var path = Path()
    
    path.addArc(
      center: CGPoint(x: rect.size.width / 2, y: rect.size.height / 2),
      radius: rect.size.width / 2,
      startAngle: .degrees(start),
      endAngle: .degrees(end),
      clockwise: true
    )
    path = path.trimmedPath(from: 0.0, to: 0.6)
      
    return path.strokedPath(.init(lineWidth: rect.size.height * 0.1))
  }
}

struct RingSpinner_Previews: PreviewProvider {
  static var previews: some View {
    RingSpinner()
      .frame(width: 40, height: 40, alignment: .center)
      .previewLayout(.sizeThatFits)
  }
}
