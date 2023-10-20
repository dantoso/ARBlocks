import ARKit
import SceneKit

/// This file declares functions that are run autommatically as reactions to certain AR events
extension GameViewController: ARSCNViewDelegate, ARSessionDelegate {

	/// Runs every time an anchor is created by the AR scene, I use it to identify when the anchor is a plane anchor to add a plane node to the scene
	func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
		guard let planeAnchor = anchor as? ARPlaneAnchor else { return nil }
		let node = SCNNode()

		let plane = SCNPlane(width: CGFloat(planeAnchor.planeExtent.width), height: CGFloat(planeAnchor.planeExtent.height))
		plane.firstMaterial?.diffuse.contents = UIColor.white.withAlphaComponent (0.5)

		let planeNode = SCNNode(geometry: plane)
		planeNode.position = SCNVector3(x: planeAnchor.center.x, y: 0, z: planeAnchor.center.z)
		planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
		planeNode.name = "myPlane"
		updateMaterialFor(geometry: plane)

		node.addChildNode(planeNode)
		anchors.insert(planeAnchor)

		return node
	}

	/// Runs every time the AR scene updates an existing anchor, I first check if the anchor to be updated represents a plane, if yes, then updates the plane accordingly
	func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
		guard
			let planeAnchor = anchor as? ARPlaneAnchor,
			anchors.contains(planeAnchor),
			let node = node.childNodes.first
		else { return }

		node.position = .init(x: planeAnchor.center.x, y: 0, z: planeAnchor.center.z)

		guard let plane = node.geometry as? SCNPlane else { return }
		plane.width = CGFloat(planeAnchor.planeExtent.width)
		plane.height = CGFloat(planeAnchor.planeExtent.height)

		updateMaterialFor(geometry: plane)
	}

	/// Runs every time the camera updates a frame, I use it to get the camera's transform matrix (position and direction in the world)
	func session(_ session: ARSession, didUpdate frame: ARFrame) {
		cameraTransform = frame.camera.transform
	}

	func updateMaterialFor(geometry: SCNPlane) {
		geometry.firstMaterial?.diffuse.contentsTransform = SCNMatrix4MakeScale(Float(geometry.width), Float(geometry.height), 0)
	}
}
