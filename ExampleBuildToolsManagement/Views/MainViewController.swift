//
//  ExampleBuildToolsManagement
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var logoImageView: UIImageView!

    static func instantiate() -> MainViewController {
        return StoryboardScene.MainView.initialScene.instantiate()
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
    }
}
