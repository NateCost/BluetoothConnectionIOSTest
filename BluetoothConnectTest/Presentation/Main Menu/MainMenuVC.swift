//
//  Created by Ilya Sakalou on 10/31/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import UIKit

final class MainMenuVC: UIViewController {
  var output: MainMenuViewOutput?
  
  override func loadView() {
    super.loadView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    output?.viewDidLoad()
    view.backgroundColor = .gray
  }
}
// MARK: - MainMenuViewInput
extension MainMenuVC: MainMenuViewInput {}
// MARK: - Layout
private extension MainMenuVC {}
