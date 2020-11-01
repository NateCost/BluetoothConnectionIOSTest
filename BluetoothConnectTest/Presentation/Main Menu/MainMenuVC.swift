//
//  Created by Ilya Sakalou on 10/31/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import UIKit

final class MainMenuVC: UIViewController {
  let colorPalette: ColorPalette
  var output: MainMenuViewOutput?
  
  init(colorPalette: ColorPalette) {
    self.colorPalette = colorPalette
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    super.loadView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    output?.viewDidLoad()
    view.backgroundColor = colorPalette.mainBackgroundColor
  }
}
// MARK: - MainMenuViewInput
extension MainMenuVC: MainMenuViewInput {}
// MARK: - Layout
private extension MainMenuVC {}
