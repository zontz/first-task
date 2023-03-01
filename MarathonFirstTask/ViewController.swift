

import UIKit

class ViewController: UIViewController {

    // MARK: - UI

    private let gradientSquareView = UIView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientSquareView.setGradientAndShadow(colors: [UIColor.blue.cgColor,UIColor.red.cgColor])
    }

    // MARK: - Layout

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(gradientSquareView)
    }

    private func setupConstraints() {
        gradientSquareView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(75)
            make.left.equalToSuperview().inset(100)
        }
    }
}

extension UIView {
    func setGradientAndShadow(colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = 16
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
