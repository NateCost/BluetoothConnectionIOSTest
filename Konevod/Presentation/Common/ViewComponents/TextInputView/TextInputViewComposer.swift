//
//  Created by Ilya Sakalou on 16.11.20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import Foundation

final class TextInputComposer {
  let view: TextInputView<TextInputStore>
  let store: TextInputStore
  
  class func compose() -> TextInputComposer {
    let store = TextInputStore()
    let view = TextInputView(placeholder: "Please enter text", store: store)
    return TextInputComposer(view: view, store: store)
  }
  
  private init(view: TextInputView<TextInputStore>, store: TextInputStore) {
    self.view = view
    self.store = store
  }
}

protocol TextInputViewInput: class {}

protocol TextInputViewOutput: ObservableObject {
  var state: TextInputViewState { get set }
  var errorText: String { get }
  var enteredText: String { get set }
}
