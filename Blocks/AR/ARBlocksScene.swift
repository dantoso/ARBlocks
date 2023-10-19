import ARKit
import RealityKit

final class ARBlocksScene: ARSCNView {
	override init(frame frameRect: CGRect) {
		super.init(frame: frameRect, options: nil)
	}

	func createBox(at position: SCNVector3, options: BlockCreationOptions) {
		let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
		box.firstMaterial?.diffuse.contents = options.color

		let node = SCNNode(geometry: box)
		node.name = "myBlock"

		node.position = position

		self.scene.rootNode.addChildNode(node)
	}

	func didTapNode(node: SCNNode) {
		node.opacity = node.opacity == 1 ? 0.8 : 1
	}

	func removeBox(node: SCNNode) {
		node.removeFromParentNode()
	}

	@MainActor required dynamic init?(coder decoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	convenience init() {
		self.init(frame: UIScreen.main.bounds)
	}
}
