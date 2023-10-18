import UIKit
import ARKit

final class GameViewController: UIViewController {
	lazy var sceneView = ARBlocksScene()
	var anchors: Set<ARAnchor> = []

	let uiPublisher: UIPublisher

	init(uiPublisher: UIPublisher) {
		self.uiPublisher = uiPublisher
		super.init(nibName: nil, bundle: nil)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		sceneView.delegate = self
		sceneView.autoenablesDefaultLighting = false
		sceneView.scene = SCNScene()

		view.addSubview(sceneView)
		setupConstraints()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		addARConfiguration()
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		guard 
			!anchors.isEmpty,
			let touch = touches.first
		else { return }

		let location = touch.location(in: sceneView)

		hitTest(location: location)
	}

	func hitTest(location: CGPoint) {
		let results = sceneView.hitTest(location, options: [.searchMode: 1])

		for result in results {
			switch result.node.name {
			case "myPlane":
				let position = result.worldCoordinates
				sceneView.createBox(at: position)
				return

			case "myBlock":
				let normal = result.worldNormal

				var position = result.node.position
				position.y += 0.1 * normal.y
				position.x += 0.1 * normal.x
				position.z += 0.1 * normal.z

				sceneView.createBox(at: position)
				return

			default:
				continue
			}
		}
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

		sceneView.debugOptions = [.showWorldOrigin, .showWireframe, .showFeaturePoints]
	}

	required init?(coder: NSCoder) {
		fatalError("not implemented")
	}
}
