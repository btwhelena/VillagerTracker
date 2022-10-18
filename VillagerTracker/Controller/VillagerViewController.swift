import UIKit

class VillagerViewController: UIViewController {

    var villager: Villager
    var screen = VillagerView()

    override func loadView() {
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 150/255, green: 210/255, blue: 197/255, alpha: 1.00)
        screen.villagerImage.downloaded(from: villager.imageURL, contentMode: .scaleAspectFill)
        screen.villagerName.text = "\(villager.name.villagereEnglishName)"
        screen.villagerInfo.text =
        """
        Specie: \(villager.species)

        Gender: \(villager.gender)

        Personality: \(villager.personality)

        Birthday: \(villager.birthdayString)

        Catch phrase: "\(villager.catchPhrase)"
        """
    }

    init(with villager: Villager) {
        self.villager = villager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
