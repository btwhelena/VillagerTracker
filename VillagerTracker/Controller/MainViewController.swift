import Foundation
import UIKit

class MainViewController: UIViewController {

    var tableView = UITableView()
    var villagers: [Villager] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // tirando o separador da lista e customizando o titulo
        self.tableView.separatorColor = UIColor.clear
        self.title = "All villagers"
        self.navigationController?.navigationBar.prefersLargeTitles = true

        // pegando todos os villagers da api e configurando a table view (registrando a celula e sua altura)
        getAllVillagers()
        configureTableView()

        // configurando o estilo da navbar
        let standard = UINavigationBarAppearance()
        standard.configureWithOpaqueBackground()
        standard.backgroundColor = UIColor(red: 78/255, green: 186/255, blue: 162/255, alpha: 1.00)
        standard.titleTextAttributes = [.foregroundColor: UIColor.white]
        standard.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        let compact = UINavigationBarAppearance()
        compact.configureWithOpaqueBackground()
        compact.backgroundColor = UIColor(red: 78/255, green: 186/255, blue: 162/255, alpha: 1.00)
        compact.titleTextAttributes = [.foregroundColor: UIColor.white]
        compact.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        self.navigationController?.navigationBar.standardAppearance = compact
        self.navigationController?.navigationBar.scrollEdgeAppearance = standard

        self.navigationController?.navigationBar.compactAppearance = compact
        self.navigationController?.navigationBar.compactScrollEdgeAppearance = compact

    }

    // chamando a API e criando um array de villagers
    func getAllVillagers() {
        API.shared.getAllVillagers { [self] result in
            switch result {
            case .success(let array):
                self.villagers = array
            case .failure(let error):
                print("🤡", error)
            }
        }
    }

    // configuracao da table view (é chamado no viewdidload)
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(VillagerListCell.self, forCellReuseIdentifier: "VillagerListCell")
        tableView.pin(to: view)
    }

    // setando os dados da view
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    // definindo que a quantidade de células da table view é a quantidade de villagers
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return villagers.count
    }

    // definindo a villagerlistcell como célula padrao da tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VillagerListCell") as? VillagerListCell
        if let cell = cell {
            let villager = villagers[indexPath.row]
            cell.set(villager: villager)
            return cell
        }
        return UITableViewCell()
    }

    // definindo que ao clicar na celula, será chamada a funcao de navegacao, passando o villager daquela celula
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let villager = villagers[indexPath.row]
        navigation(with: villager)
    }

    // navegando para uma nova view em forma de sheet e configurando o visual da sheet
    func navigation (with villager: Villager) {
        let viewController = VillagerViewController(with: villager)
        if let sheet = viewController.sheetPresentationController {
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        present(viewController, animated: true, completion: nil)
    }
}

extension UIView {

    // constraints da tela
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}
