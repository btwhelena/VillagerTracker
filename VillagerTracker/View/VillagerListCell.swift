import UIKit

class VillagerListCell: UITableViewCell {

    var villagerImageView = UIImageView()
    var villagerName = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(villagerImageView)
        addSubview(villagerName)

        configureImageView()
        configureVillagerName()
        setVillagerImageConstraints()
        setVillagerNameConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(villager: Villager) {
        villagerImageView.downloaded(from: villager.imageURL)
        villagerName.text = villager.name.villagereEnglishName
    }

    func configureImageView() {
        villagerImageView.layer.cornerRadius = 10
        villagerImageView.clipsToBounds = true
    }

    func configureVillagerName() {
        villagerName.numberOfLines = 0
        villagerName.adjustsFontSizeToFitWidth = true
    }

    func setVillagerImageConstraints() {
        villagerImageView.translatesAutoresizingMaskIntoConstraints = false

        villagerImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        villagerImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        villagerImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        villagerImageView.widthAnchor.constraint(equalTo: villagerImageView.heightAnchor,
                                                 multiplier: 16/9).isActive = true
    }

    func setVillagerNameConstraints() {
        villagerName.translatesAutoresizingMaskIntoConstraints = false

        villagerName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        villagerName.leadingAnchor.constraint(equalTo: villagerImageView.trailingAnchor, constant: 20).isActive = true
        villagerName.heightAnchor.constraint(equalToConstant: 80).isActive = true
        villagerName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.villagerImageView.image = nil
        self.villagerName.text = nil
    }

}
