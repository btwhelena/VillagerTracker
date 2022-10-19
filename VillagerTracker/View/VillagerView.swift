import UIKit

class VillagerView: UIView {

// criando botao de adicionar à ilha
    let islandButton: UIButton = {
        let islandButton = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        let largeBoldHeart = UIImage(systemName: "plus.circle.fill", withConfiguration: largeConfig)
        islandButton.layer.cornerRadius = 30
        islandButton.backgroundColor = .white
        islandButton.setImage(largeBoldHeart?.withTintColor(.gray,
                                                renderingMode: .alwaysOriginal), for: .normal)
       islandButton.frame = CGRect(x: 25, y: 50, width: 60, height: 60)
        return islandButton
    }()

// criando botao de favoritar
    let favoriteButton: UIButton = {
        let favoriteButton = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        let largeBoldHeart = UIImage(systemName: "suit.heart.fill", withConfiguration: largeConfig)
        favoriteButton.layer.cornerRadius = 30
        favoriteButton.backgroundColor = .white
        favoriteButton.setImage(largeBoldHeart?.withTintColor(.gray,
                                                renderingMode: .alwaysOriginal), for: .normal)
        favoriteButton.frame = CGRect(x: 300, y: 50, width: 60, height: 60)
        return favoriteButton
    }()

// criando label para exibir o nome do villager
    var villagerName: UILabel = {
        var villagerName = UILabel()
        villagerName.translatesAutoresizingMaskIntoConstraints = false
        villagerName.textAlignment = .center
        villagerName.text = ""
        villagerName.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.regular)
        return villagerName
    }()

// criando foto do villager
    var villagerImage: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 30
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "")
        return imageView
    }()

// criando box de informaçoes do villager
    var villagerInfo: UITextView = {
        var villagerInfo = UITextView()
        villagerInfo.translatesAutoresizingMaskIntoConstraints = false
        villagerInfo.backgroundColor = UIColor(red: 251/255, green: 240/255, blue: 226/255, alpha: 1.00)
        villagerInfo.layer.cornerRadius = 10
        villagerInfo.textAlignment = .center
        villagerInfo.text = ""
        villagerInfo.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular)
        villagerInfo.isEditable = false
        return villagerInfo
    }()

// iniciando a view, adicionando os elementos anteriores a ela, e setando as constraints de cada coisa
    init() {
        super.init(frame: .zero)
        self.addSubview(islandButton)
        self.addSubview(favoriteButton)
        self.addSubview(villagerName)
        self.addSubview(villagerImage)
        self.addSubview(villagerInfo)
        setupNameConstrainsts()
        setupImageConstrainsts()
        setupVillagerInfoConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// constraints do nome do villager
    func setupNameConstrainsts() {
        NSLayoutConstraint.activate([
            villagerName.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            villagerName.leftAnchor.constraint(equalTo: self.leftAnchor),
            villagerName.rightAnchor.constraint(equalTo: self.rightAnchor),
            villagerName.bottomAnchor.constraint(equalTo: villagerImage.topAnchor, constant: 75)
        ])
    }

// constraints da foto do villager
    func setupImageConstrainsts() {
        NSLayoutConstraint.activate([
            villagerImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -75),
            villagerImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            villagerImage.widthAnchor.constraint(equalToConstant: 250),
            villagerImage.heightAnchor.constraint(equalToConstant: 250)
        ])
    }

// constraints das informacoes do villager
    func setupVillagerInfoConstraints() {
        NSLayoutConstraint.activate([
            villagerInfo.topAnchor.constraint(equalTo: villagerImage.bottomAnchor, constant: 30),
            villagerInfo.leftAnchor.constraint(equalTo: self.leftAnchor),
            villagerInfo.rightAnchor.constraint(equalTo: self.rightAnchor),
            villagerInfo.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
