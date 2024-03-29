import UIKit
import ARKit

/// The game. This object handles all the AR Logic, in this file, only the setup is visible
final class GameViewController: UIViewController {

	/// The scene view, which shows the AR session
	lazy var sceneView = ARBlocksScene()
	var anchors: Set<ARAnchor> = []
	var cameraTransform: simd_float4x4 = .init()

	let uiPublisher: UIPublisher

	init(uiPublisher: UIPublisher) {
		self.uiPublisher = uiPublisher
		super.init(nibName: nil, bundle: nil)
	}

	/// Runs every time this object's view (AKA sceneView)  is lodaded into memory
	override func viewDidLoad() {
		super.viewDidLoad()
		
		sceneView.delegate = self
		sceneView.session.delegate = self
		sceneView.autoenablesDefaultLighting = false
		sceneView.scene = SCNScene()

		view.addSubview(sceneView)
		setupConstraints()
	}

	/// Runs every time sceneView is going to appear
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		addARConfiguration()
	}

	/// Runs every time the user touches the AR scene
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		guard 
			!anchors.isEmpty,
			let touch = touches.first
		else { return }

		let location = touch.location(in: sceneView)

		executeActionAt(location: location)
	}

	/// Sets constraints for the AR view to occupy the correct screen space
	func setupConstraints() {
		sceneView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
		sceneView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
		sceneView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
		sceneView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
	}

	/// Adds necessary configuration to the AR scene for plane detection and world recognition
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
