import Foundation
import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        getAllVillagers()
    }
    private func getAllVillagers() {
        API.shared.getAllVillagers { result in
            switch result {
            case .success(let array):
                for villager in array {
                    print(villager.name)
                }
            case .failure(let error):
                print("🤡", error)
            }
        }
    }
}
