import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

// criando itens da tab bar
        tabBar.barTintColor = UIColor(red: 78/255, green: 185/255, blue: 161/255, alpha: 1.00)
        let vc1 = UINavigationController(rootViewController: IslandViewController())
        let vc2 = UINavigationController(rootViewController: MainViewController())
        let vc3 = UINavigationController(rootViewController: FavoritesViewController())

// definindo ícones das abas da tab bar
        vc1.tabBarItem.image = UIImage(systemName: "sun.and.horizon")
        vc2.tabBarItem.image = UIImage(systemName: "leaf")
        vc3.tabBarItem.image = UIImage(systemName: "heart")

// definindo títulos das abas da tab bar
        vc1.title = "Island Villagers"
        vc2.title = "Villagers"
        vc3.title = "Favorites"

// deixando a tab bar sem transparencia
        tabBar.isOpaque = false
        tabBar.isTranslucent = false

// definindo qual a cor da aba selecionada e qual a cor das nao selecionadas
        tabBar.unselectedItemTintColor = UIColor(red: 0.20, green: 0.41, blue: 0.31, alpha: 1.00)
        tabBar.tintColor = .white

// setando todas as abas e definindo qual a aba inicial quando o app abre
        setViewControllers([vc1, vc2, vc3], animated: false)
        selectedIndex = 1
    }
}
