//
//  Created by Ilya Sakalou on 10/31/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import XCTest
@testable import BluetoothConnectTest

class SplashPresenterTest: XCTestCase {
  func testViewDidLoadActivateLoading() {
    let sut = makeSUT()
    sut.viewDidLoad()
    XCTAssertEqual(sut.loadController.state, .active)
  }
  
  func makeSUT(view: SplashViewInput? = SplashViewSpy()) -> SplashPresenter {
    let loadController = ActivatableItemControl(item: ActivatableItemSpy())
    let sut = SplashPresenter(view: view!, loadController: loadController)
    return sut
  }
  
  final class SplashViewSpy: SplashViewInput {}
  
  final class ActivatableItemSpy: Selectable {
    func setState(_ state: ActivationState) {}
  }
}
