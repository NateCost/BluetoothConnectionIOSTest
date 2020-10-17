//
//  Created by Ilya Sakalou on 10/16/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import UIKit

final class SplashVC: UIViewController {
  lazy var logoImageView: UIImageView = {
    let logoImageView = UIImageView(frame: .zero)
    logoImageView.translatesAutoresizingMaskIntoConstraints = false
    return logoImageView
  }()
  
  override func loadView() {
    super.loadView()
    view.addSubview(logoImageView)
    layoutLogo()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    logoImageView.backgroundColor = .red
    view.backgroundColor = .white
  }
}
// MARK: - Layout
private extension SplashVC {
  func layoutLogo() {
    NSLayoutConstraint.activate([
      logoImageView.widthAnchor.constraint(equalToConstant: 100),
      logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
      logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}
