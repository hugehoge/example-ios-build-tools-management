//
//  ExampleBuildToolsManagement
//

import UIKit

import Kingfisher

class MainViewController: UIViewController {
    @IBOutlet var logoImageView: UIImageView!

    static func instantiate() -> MainViewController {
        StoryboardScene.MainView.initialScene.instantiate()
    }

    @available(*, unavailable)
    private init() {
        fatalError("init() has not been implemented")
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        logoImageView.kf.setImage(
            with: URL(string: "https://developer.apple.com/swift/images/swift-logo.svg"),
            options: [.processor(SVGProcessor())]
        )
    }
}
