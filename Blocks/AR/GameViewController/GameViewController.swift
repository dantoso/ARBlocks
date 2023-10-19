import UIKit
import ARKit

final class GameViewController: UIViewController {
	lazy var sceneView = ARBlocksScene()
	var anchors: Set<ARAnchor> = []
	var cameraTransform: simd_float4x4 = .init()
	var plane: SCNPlane?

	let uiPublisher: UIPublisher

	init(uiPublisher: UIPublisher) {
		self.uiPublisher = uiPublisher
		super.init(nibName: nil, bundle: nil)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		sceneView.delegate = self
		sceneView.session.delegate = self
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

		executeActionAt(location: location)
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

		sceneView.debugOptions = [.showWireframe, .showFeaturePoints]
	}

	required init?(coder: NSCoder) {
		fatalError("not implemented")
	}
}
