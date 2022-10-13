import UIKit

class FavoritesViewController: UIViewController {

//    var tableView = UITableView()
//    var villagers: [Villager] = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Favorite villagers"
//        villagers = fetchData()
//        configureTableView()
//    }
//    
//    func configureTableView(){
//        view.addSubview(tableView)
//        setTableViewDelegates()
//        tableView.rowHeight = 100
//        tableView.register(VillagerListCell.self, forCellReuseIdentifier: "VillagerListCell")
//        tableView.pin(to: view)
//    }
//    
//    func setTableViewDelegates(){
//        tableView.delegate = self
//        tableView.dataSource = self
//    }
//    
// }
//
// extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource{
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return villagers.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "VillagerListCell") as! VillagerListCell
//        let villager = villagers[indexPath.row]
//        cell.set(villager: villager)
//        
//        return cell
//    }
// }
//
// extension FavoritesViewController {
//    
//    func fetchData() -> [Villager] {
//        //let villager1 = Villager(id: 1, fileName: "", personality: "teste", birthdayString: "teste", birthday:
// "teste", species: "dog", gender: "female", catchPhrase: "teste", name: "Isabelle", iconURL: "",
// imageURL: UIImage(named: "isabelle")!)
//                                 
//        //let villager2 = Villager(id: 1, fileName: "", personality: "teste", birthdayString: "teste", birthday:
// "teste", species: "dog",gender: "female", catchPhrase: "teste", name: "Isabelle", iconURL: "",
// imageURL: UIImage(named: "isabelle")!)
//                                 
//        //let villager3 = Villager(id: 1, fileName: "", personality: "teste", birthdayString: "teste", birthday:
// "teste", species: "dog",gender: "female", catchPhrase: "teste", name: "Isabelle", iconURL: "",
// imageURL: UIImage(named: "isabelle")!)
//        
//        //return [villager1, villager2, villager3]
//        return []
//    }
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
