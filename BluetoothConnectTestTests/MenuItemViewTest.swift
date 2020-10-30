//
//  Created by Ilya Sakalou on 10/24/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import XCTest
@testable import BluetoothConnectTest

class MenuItemViewTest: XCTestCase {
  func testActionTriggered() {
    var testActionCalled = false
    let testAction: (_ completion: Handler?) -> Void = { _ in
      testActionCalled = true
    }
    let sut = makeSUT(action: testAction)
    
    sut.activate()
    
    XCTAssertTrue(testActionCalled)
  }
  
  func testDefaultState() {
    XCTAssertEqual(makeSUT().state, .deselected)
  }
  
  func testSelectedStateTriggered() {
    let sut = makeSUT(action: { _ in })
    sut.activate()
    XCTAssertEqual(sut.state, .selected)
  }
  
  func testSelectedStateNotTriggeredWithoutAction() {
    let sut = makeSUT()
    sut.activate()
    XCTAssertEqual(sut.state, .deselected)
  }
  
  func testDeselectedStateOnActionCompletion() {
    let expectation = XCTestExpectation(description: "")
    let testAction: (_ completion: Handler?) -> Void = { completion in
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        completion?()
        expectation.fulfill()
      }
    }
    let sut = makeSUT(action: testAction)
    sut.activate()
    
    XCTAssertEqual(sut.state, .selected)
    wait(for: [expectation], timeout: 1.0)
    XCTAssertEqual(sut.state, .deselected)
  }
  
  func makeSUT(
    action: ((_ completion: Handler?) -> Void)? = nil
  ) -> MenuItem {
    let sut = MenuItemView()
    sut.action = action
    return sut
  }
}
