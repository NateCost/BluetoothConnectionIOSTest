//
//  Created by Ilya Sakalou on 10/24/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import XCTest
@testable import BluetoothConnectTest

class MenuItemControlTest: XCTestCase {
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
    XCTAssertEqual(makeSUT().state, .inactive)
  }
  
  func testSelectedStateTriggered() {
    let sut = makeSUT(action: { _ in })
    sut.activate()
    XCTAssertEqual(sut.state, .active)
  }
  
  func testSelectedStateNotTriggeredWithoutAction() {
    let sut = makeSUT()
    sut.activate()
    XCTAssertEqual(sut.state, .inactive)
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
    
    XCTAssertEqual(sut.state, .active)
    wait(for: [expectation], timeout: 1.0)
    XCTAssertEqual(sut.state, .inactive)
  }
  
  func testSelectableChangeState() {
    let selectable = SelectableSpy()
    let sut = makeSUT(action: { _ in }, selectable: selectable)
    
    sut.activate()
    
    XCTAssertEqual(selectable.state, .active)
  }
  
  func testActivatableItemBindActionHandler() {
    var testActionCalled = false
    let testAction: (_ completion: Handler?) -> Void = { _ in
      testActionCalled = true
    }
    let selectable = SelectableSpy()
    _ = makeSUT(action: testAction, selectable: selectable)
    
    selectable.tapAction?()
    
    XCTAssertTrue(testActionCalled)
  }
  
  func makeSUT(
    action: ((_ completion: Handler?) -> Void)? = nil,
    selectable: SelectableSpy = SelectableSpy()
  ) -> ActivatableItem {
    let sut = ActivatableItemControl(item: selectable)
    sut.action = action
    return sut
  }
  
  final class SelectableSpy: Selectable {
    typealias State = ActivationState
    var tapAction: Handler?
    var state: State = .inactive
    
    func setState(_ state: State) {
      self.state = state
    }
  }
}
