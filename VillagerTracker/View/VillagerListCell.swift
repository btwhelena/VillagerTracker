import UIKit

class VillagerListCell: UITableViewCell {

// criando variável para armazenar a foto do villager e o nome
    var villagerImageView = UIImageView()
    var villagerName = UILabel()
    let bgView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(red: 150/255, green: 210/255, blue: 197/255, alpha: 1.00)
        addSubview(bgView)
        bgView.addSubview(villagerImageView)
        bgView.addSubview(villagerName)

        configureImageView()
        configureVillagerName()
        setBgViewConstraints()
        setVillagerImageConstraints()
        setVillagerNameConstraints()

        self.selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.backgroundColor = UIColor(red: 251/255, green: 240/255, blue: 226/255, alpha: 1.00)
        bgView.layer.cornerRadius = self.bgView.frame.height / 2
    }

// baixando imagem do villager e trazendo o nome, via get na API
    func set(villager: Villager) {
        villagerImageView.downloaded(from: villager.iconURL)
        villagerName.text = villager.name.villagereEnglishName
    }

// colocando borda na imagem
    func configureImageView() {
        villagerImageView.layer.cornerRadius = 10
        villagerImageView.layer.cornerRadius =  villagerImageView.frame.height / 2
        villagerImageView.clipsToBounds = true
    }

// deixando o nome do villager ajustável
    func configureVillagerName() {
        villagerName.numberOfLines = 0
        villagerName.adjustsFontSizeToFitWidth = true
    }

    func setBgViewConstraints() {

        bgView.translatesAutoresizingMaskIntoConstraints = false

//        bgView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        bgView.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        bgView.widthAnchor.constraint(
            equalTo: self.widthAnchor,
            multiplier: 0.9
        ).isActive = true
        bgView.topAnchor.constraint(
            equalTo: self.topAnchor,
            constant: 10
        ).isActive = true
        bgView.heightAnchor.constraint(
            equalTo: self.heightAnchor,
            multiplier: 0.9
        ).isActive = true
        let bottom = bgView.bottomAnchor.constraint(
            equalTo: self.bottomAnchor
        )
        bottom.priority = .defaultLow
        bottom.isActive = true
    }

// constraints da imagem do villager
    func setVillagerImageConstraints() {
        villagerImageView.translatesAutoresizingMaskIntoConstraints = false

        villagerImageView.centerYAnchor.constraint(equalTo: bgView.centerYAnchor).isActive = true
        villagerImageView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 12).isActive = true
        villagerImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        villagerImageView.widthAnchor.constraint(equalTo: villagerImageView.heightAnchor,
                                                 multiplier: 16/9).isActive = true
    }

// constraints do nome do villager
    func setVillagerNameConstraints() {
        villagerName.translatesAutoresizingMaskIntoConstraints = false

        villagerName.centerYAnchor.constraint(equalTo: bgView.centerYAnchor).isActive = true
        villagerName.leadingAnchor.constraint(equalTo: villagerImageView.trailingAnchor, constant: 20).isActive = true
        villagerName.heightAnchor.constraint(equalToConstant: 80).isActive = true
        villagerName.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -12).isActive = true
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.villagerImageView.image = nil
        self.villagerName.text = nil
    }
}
