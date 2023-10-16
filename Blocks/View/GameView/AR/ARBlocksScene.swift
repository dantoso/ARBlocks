import ARKit
import RealityKit

final class ARBlocksScene: ARSCNView {
	override init(frame frameRect: CGRect) {
		super.init(frame: frameRect, options: nil)
	}
	
	override func didMoveToSuperview() {
		let box = SCNBox(width: 0.3, height: 0.3, length: 0.3, chamferRadius: 0)
		box.firstMaterial?.diffuse.contents = UIColor.systemPink

		let node = SCNNode(geometry: box)
		node.castsShadow = true
		self.scene.rootNode.addChildNode(node)
		node.position = SCNVector3(x: 0, y: 0, z: -1)
	}
	@MainActor required dynamic init?(coder decoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	convenience init() {
		self.init(frame: UIScreen.main.bounds)
	}
}
