import ARKit
import RealityKit

final class ARBlocksScene: ARSCNView {
	override init(frame frameRect: CGRect) {
		super.init(frame: frameRect, options: nil)
	}

	func createBox(at position: SCNVector3) {
		let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
		box.firstMaterial?.diffuse.contents = UIColor.systemPink

		let node = SCNNode(geometry: box)
		node.name = "myBlock"

		node.position = position
		self.scene.rootNode.addChildNode(node)
	}
	
	@MainActor required dynamic init?(coder decoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	convenience init() {
		self.init(frame: UIScreen.main.bounds)
	}
}
