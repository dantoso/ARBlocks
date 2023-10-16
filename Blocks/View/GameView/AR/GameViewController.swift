import UIKit
import ARKit

final class GameViewController: UIViewController {
	lazy var sceneView = ARBlocksScene()

	init() {
		super.init(nibName: nil, bundle: nil)
	}

	override func viewDidLoad() {
		view.addSubview(sceneView)
		setupConstraints()
		addARConfiguration()
	}

	func setupConstraints() {
		sceneView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
		sceneView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
		sceneView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
		sceneView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
	}

	func addARConfiguration() {
		let config = ARWorldTrackingConfiguration()
		config.isLightEstimationEnabled = true
		config.planeDetection = .horizontal

		sceneView.session.run(config)

		sceneView.debugOptions = [.showBoundingBoxes, .showWireframe, .showFeaturePoints]
	}

	required init?(coder: NSCoder) {
		fatalError("not implemented")
	}
}
