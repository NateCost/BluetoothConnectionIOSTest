//
//  Created by Ilya Sakalou on 11/1/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import UIKit

protocol ColorPalette {
  var mainBackgroundColor: UIColor { get }
  var spinnerColor: UIColor { get }
  var mainTextColor: UIColor { get }
  var secondaryColor: UIColor { get }
}

struct RegularIOSPalette: ColorPalette {
  let mainBackgroundColor = #colorLiteral(red: 0.1960784314, green: 0.1215686275, blue: 0.1568627451, alpha: 1)
  let spinnerColor = #colorLiteral(red: 0.6039215686, green: 0.8274509804, blue: 0.737254902, alpha: 1)
  let mainTextColor = #colorLiteral(red: 0.9529411765, green: 0.9176470588, blue: 0.7607843137, alpha: 1)
  let secondaryColor = #colorLiteral(red: 0.9607843137, green: 0.7058823529, blue: 0.3803921569, alpha: 1)
}

struct ColorBlindIOSPalette: ColorPalette {
  let mainBackgroundColor = #colorLiteral(red: 0.1960784314, green: 0.1215686275, blue: 0.1568627451, alpha: 1)
  let spinnerColor = #colorLiteral(red: 0.6039215686, green: 0.8274509804, blue: 0.737254902, alpha: 1)
  let mainTextColor = #colorLiteral(red: 0.9529411765, green: 0.9176470588, blue: 0.7607843137, alpha: 1)
  let secondaryColor = #colorLiteral(red: 0.9607843137, green: 0.7058823529, blue: 0.3803921569, alpha: 1)
}

enum IOSPalette: ColorPalette {
  var mainBackgroundColor: UIColor { value.mainBackgroundColor }
  var spinnerColor: UIColor { value.spinnerColor }
  var mainTextColor: UIColor { value.mainTextColor }
  var secondaryColor: UIColor { value.secondaryColor }
  
  case `default`
  case colorBlind
  
  var value: ColorPalette {
    switch self {
      case .default: return RegularIOSPalette()
      case .colorBlind: return ColorBlindIOSPalette()
    }
  }
}
