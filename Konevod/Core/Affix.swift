//
//  Created by Ilya Sakalou on 25.01.21.
//  Copyright © 2021 Nirma Studio. All rights reserved.
//

import Foundation

protocol AffixContainer {
  associatedtype Affix
  var affixes: [Affix] { get }
}
