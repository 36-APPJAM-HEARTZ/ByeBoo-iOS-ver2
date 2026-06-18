
import UIKit

import HomeFeatureInterface

public class HomeFeatureViewController: UIViewController {
    private weak var coordinator: HomeCoordinatorProtocol?
    
    init(coordinator: HomeCoordinatorProtocol) {
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        coordinator?.finished?()
    }
}
