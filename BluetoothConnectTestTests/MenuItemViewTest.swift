//
//  Created by Ilya Sakalou on 10/24/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import XCTest
@testable import BluetoothConnectTest

class MenuItemViewTest: XCTestCase {
  func testActionTriggered() {
    var testActionCalled = false
    let testAction: Handler = { testActionCalled = true }
    let sut = makeSUT(action: testAction, actionCompletion: nil)
    
    sut.activate()
    
    XCTAssertTrue(testActionCalled)
  }
  
  func makeSUT(action: Handler?, actionCompletion: Handler?) -> MenuItemView {
    let sut = MenuItemView()
    sut.action = action
    sut.actionCompletion = actionCompletion
    return sut
  }
}
