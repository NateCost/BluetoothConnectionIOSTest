//
//  Created by Ilya Sakalou on 16.11.20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

enum TextInputViewState {
  case input
  case error
}

final class AuthorizationUseCase {
  
}

final class TextInputStore: TextInputViewOutput {
  @Published var state: TextInputViewState
  @Published var errorText: String
  @Published var enteredText: String
  
  init(
    state: TextInputViewState = .input,
    errorText: String = "",
    enteredText: String = ""
  ) {
    self.state = state
    self.errorText = errorText
    self.enteredText = enteredText
  }
}
