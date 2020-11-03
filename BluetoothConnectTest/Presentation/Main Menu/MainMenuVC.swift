//
//  Created by Ilya Sakalou on 10/31/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import UIKit

final class MainMenuVC<Palette: ColorPalette>: UIViewController {
  private lazy var startButton: SelectableButton = { SelectableButton(frame: .zero) }()
  
  let colorPalette: Palette
  var output: MainMenuViewOutput?
  
  init(colorPalette: Palette) {
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
