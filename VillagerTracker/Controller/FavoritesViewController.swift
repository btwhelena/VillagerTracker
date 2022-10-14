import Foundation
import UIKit

class FavoritesViewController: UIViewController {

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
        title = "Favorite villagers"
        getAllVillagers()
        configureTableView()
    }

    func getAllVillagers() {
       API.shared.getAllVillagers { [self] result in
                switch result {
                case .success(let array):
                    self.villagers = array
//                    for villager in array {
//                        self.villagers = [villager]
//                        print(self.villagers)
//                    }
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

 extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {

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
