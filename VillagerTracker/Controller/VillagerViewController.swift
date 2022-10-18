import UIKit

class VillagerViewController: UIViewController {

    var villager: Villager
    var screen: VillagerView?

    override func loadView() {
        self.screen = VillagerView()
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        screen?.villagerImage.downloaded(from: villager.imageURL, contentMode: .scaleAspectFill)
        screen?.villagerName.text = "\(villager.name.villagereEnglishName)"
    }

    init(with villager: Villager) {
        self.villager = villager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
