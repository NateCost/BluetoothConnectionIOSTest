//
//  Created by Ilya Sakalou on 25.01.21.
//  Copyright © 2021 Nirma Studio. All rights reserved.
//

import Foundation

struct Map: AffixContainer {
  let id: UUID
  let name: String
  let affixes: [MapAffix]
}
