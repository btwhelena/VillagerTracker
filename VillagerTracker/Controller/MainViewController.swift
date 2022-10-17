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
        self.tableView.separatorColor = UIColor.clear
        self.title = "All villagers"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        //            private func getAllVillagers() {
        //                API.shared.getAllVillagers { result in
        //                    switch result {
        //                    case .success(let array):
        //                        for villager in array {
        //                            print(villager)
        //                        }
        //                    case .failure(let error):
        //                        print("🤡", error)
        //                    }
        //                }
        //            }
        getAllVillagers()
        configureTableView()

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

    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(VillagerListCell.self, forCellReuseIdentifier: "VillagerListCell")
        tableView.pin(to: view)
    }

    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return villagers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VillagerListCell") as? VillagerListCell
        if let cell = cell {
            let villager = villagers[indexPath.row]
            cell.set(villager: villager)
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let villager = villagers[indexPath.row]
        navigation(with: villager)
    }

    func navigation (with villager: Villager) {
        let viewController = VillagerViewController(with: villager)
        viewController.modalPresentationStyle = .fullScreen

        // Sheet full screen a partir da propria view controller
//        present(viewController, animated: true, completion: nil)

        // Push full screen a partir da navigation controller (botao de back)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension UIView {

    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}
