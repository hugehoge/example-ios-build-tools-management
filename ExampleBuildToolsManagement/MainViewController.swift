//
//  ExampleBuildToolsManagement
//

import UIKit

class MainViewController: UIViewController {
    static func instantiate() -> MainViewController {
        return MainViewController()
    }

    private init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }
}
