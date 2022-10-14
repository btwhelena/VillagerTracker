import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = UIColor(red: 0.61, green: 0.81, blue: 0.67, alpha: 1.00)

        let vc1 = UINavigationController(rootViewController: IslandViewController())
        let vc2 = UINavigationController(rootViewController: MainViewController())
        let vc3 = UINavigationController(rootViewController: FavoritesViewController())

        vc1.tabBarItem.image = UIImage(systemName: "sun.and.horizon")
        vc2.tabBarItem.image = UIImage(systemName: "leaf")
        vc3.tabBarItem.image = UIImage(systemName: "heart")

        vc1.title = "Island Villagers"
        vc2.title = "Villagers"
        vc3.title = "Favorites"

        tabBar.tintColor = UIColor(red: 0.20, green: 0.41, blue: 0.31, alpha: 1.00)

        setViewControllers([vc1, vc2, vc3], animated: false)
        selectedIndex = 1
    }
}
