import UIKit

class VillagerView: UIView {

    lazy var subImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "AppIcon")
        imageView.backgroundColor = .systemGreen
        return imageView
    }()

    init() {
        super.init(frame: .zero)
        self.addSubview(subImageView)
        setupConstrainsts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstrainsts() {
        NSLayoutConstraint.activate([
            subImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            subImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            subImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            subImageView.heightAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
}
