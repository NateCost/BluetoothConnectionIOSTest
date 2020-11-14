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

struct RingSpinner: View, Selectable {
  @ObservedObject var state: RingSpinnerShapeState
  
  var tapAction: Handler?
  private var _spinner: RingSpinnerShape?
  
  private var spinnerAnimation: Animation {
    Animation.linear(duration: 0.8).repeatForever(autoreverses: false)
  }
  private var noAnimation: Animation {
    Animation.linear(duration: 0.2).repeatCount(0)
  }
  
  internal init(state: RingSpinnerShapeState = RingSpinnerShapeState()) {
    self.state = state
  }
  
  var body: some View {
    RingSpinnerShape(filledPoint: state.filledPoint)
      .animation(state.state == .active ? spinnerAnimation : noAnimation)
      .opacity(state.state == .active ? 1.0 : 0.0)
  }
  
  func setState(_ state: ActivationState) {
    DispatchQueue.main.async {
      self.state.update(with: state)
    }
  }
}

class RingSpinnerShapeState: ObservableObject {
  @Published var filledPoint: Double = 0.0
  @Published var state: ActivationState = .inactive
  
  func update(with state: ActivationState) {
    self.state = state
    switch state {
      case .active:   filledPoint = 1.0
      case .inactive: filledPoint = 0.0
    }
  }
}

struct RingSpinnerShape: Shape {
  struct Constants {
    static let totalDegree = 360.0
  }
  
  var filledPoint: Double
  var fillDelay: Double = 0.5
  
  var animatableData: Double {
    get { filledPoint }
    set { filledPoint = newValue }
  }
  
  func path(in rect: CGRect) -> Path {
    var start = 0.0
    let end = Constants.totalDegree * filledPoint
    
    if filledPoint > fillDelay {
      start = (filledPoint - fillDelay) * Constants.totalDegree
    } else {
      start = (1.0 - fillDelay + filledPoint) * Constants.totalDegree
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
    RingSpinner(state: RingSpinnerShapeState())
      .frame(width: 40, height: 40, alignment: .center)
      .previewLayout(.sizeThatFits)
  }
}
