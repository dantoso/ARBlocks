import UIKit

final class GameViewController: UIViewController {
	lazy var arView = ARBlocksView()

	init() {
		super.init(nibName: nil, bundle: nil)
	}

	override func viewDidLoad() {
		view.addSubview(arView)
		setupConstraints()
	}

	func setupConstraints() {
		arView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
		arView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
		arView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
		arView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
	}

	required init?(coder: NSCoder) {
		fatalError("not implemented")
	}
}
