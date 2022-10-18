import UIKit

class VillagerView: UIView {

    var villagerImage: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "AppIcon")
        imageView.backgroundColor = .systemGreen
        return imageView
    }()

    var villagerName: UILabel = {
        var villagerName = UILabel()
        villagerName.translatesAutoresizingMaskIntoConstraints = false
        villagerName.textAlignment = .center
        villagerName.text = ""
        villagerName.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.regular)
        return villagerName
    }()

    init() {
        super.init(frame: .zero)
        self.addSubview(villagerImage)
        self.addSubview(villagerName)
        setupNameConstrainsts()
        setupImageConstrainsts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupImageConstrainsts() {
        NSLayoutConstraint.activate([
            villagerImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            villagerImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            villagerImage.widthAnchor.constraint(equalToConstant: 300),
            villagerImage.heightAnchor.constraint(equalToConstant: 300)
        ])
    }

    func setupNameConstrainsts() {
        NSLayoutConstraint.activate([
            villagerName.topAnchor.constraint(equalTo: villagerImage.bottomAnchor, constant: 50),
            villagerName.leftAnchor.constraint(equalTo: self.leftAnchor),
            villagerName.rightAnchor.constraint(equalTo: self.rightAnchor),
            villagerName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}
