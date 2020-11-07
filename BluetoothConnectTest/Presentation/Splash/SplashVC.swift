//
//  Created by Ilya Sakalou on 10/16/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import UIKit

final class SplashVC: UIViewController {
  private lazy var logoImageView: UIImageView = {
    let logoImageView = UIImageView(frame: .zero)
    logoImageView.translatesAutoresizingMaskIntoConstraints = false
    return logoImageView
  }()
  
  private lazy var spinnerView: SpinnerView = {
    let spinnerView = SpinnerView(frame: .zero)
    spinnerView.translatesAutoresizingMaskIntoConstraints = false
    return spinnerView
  }()
  
  private let colorPalette: ColorPalette
  var output: SplashViewOutput?
  var loadController: ActivatableItem?
  
  init(colorPalette: ColorPalette) {
    self.colorPalette = colorPalette
    super.init(nibName: nil, bundle: nil)
    loadController = ActivatableItemControl(itemStateUpdateHandler: spinnerView.setState(_:))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    super.loadView()
    view.addSubview(logoImageView)
    view.addSubview(spinnerView)
    layoutLogo()
    layoutSpinner()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    output?.viewDidLoad()
    logoImageView.backgroundColor = colorPalette.secondaryColor
    spinnerView.isHidden = false
    spinnerView.setColor(colorPalette.spinnerColor)
    view.backgroundColor = colorPalette.mainBackgroundColor
  }
}
// MARK: - SplashViewInput
extension SplashVC: SplashViewInput {}
// MARK: - Layout
private extension SplashVC {
  func layoutLogo() {
    NSLayoutConstraint.activate([
      logoImageView.widthAnchor.constraint(equalToConstant: 200),
      logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
      logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
  
  func layoutSpinner() {
    NSLayoutConstraint.activate([
      spinnerView.widthAnchor.constraint(equalToConstant: 40),
      spinnerView.heightAnchor.constraint(equalTo: spinnerView.widthAnchor),
      spinnerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      spinnerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200)
    ])
  }
}
