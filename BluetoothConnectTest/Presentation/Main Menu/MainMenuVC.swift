//
//  Created by Ilya Sakalou on 10/31/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI
import UIKit

final class MainMenuVC<Palette: ColorPalette>: UIViewController {
  private lazy var startButton: SelectableButton = { SelectableButton(frame: .zero) }()
  private lazy var settingsButton: SelectableButton = { SelectableButton(frame: .zero) }()
  private lazy var aboutButton: SelectableButton = { SelectableButton(frame: .zero) }()
  
  private let colorPalette: Palette
  var output: MainMenuViewOutput?
  var startController: ActivatableItem?
  var settingsController: ActivatableItem?
  var aboutController: ActivatableItem?
  
  init(colorPalette: Palette) {
    self.colorPalette = colorPalette
    super.init(nibName: nil, bundle: nil)
    startController = ActivatableItemControl(item: startButton)
    settingsController = ActivatableItemControl(item: settingsButton)
    aboutController = ActivatableItemControl(item: aboutButton)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    super.loadView()
    layoutButtons()
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
private extension MainMenuVC {
  func layoutButtons() {
    let buttons = [startButton, settingsButton, aboutButton]
    
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(stackView)
    stackView.axis = .vertical
    stackView.spacing = 20.0
    stackView.distribution = .fillEqually
    stackView.alignment = .center
    stackView.backgroundColor = colorPalette.secondaryColor
    
    NSLayoutConstraint.activate([
      stackView.widthAnchor.constraint(equalToConstant: 200),
      stackView.heightAnchor.constraint(equalToConstant: CGFloat(buttons.count * 120)),
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
    
    buttons.forEach {
      stackView.addArrangedSubview($0)
      $0.sizeToFit()
    }
  }
}
