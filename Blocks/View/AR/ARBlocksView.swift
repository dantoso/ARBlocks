import ARKit
import RealityKit

final class ARBlocksView: ARView {
	required init(frame frameRect: CGRect) {
		super.init(frame: frameRect)
	}
	
	@MainActor required dynamic init?(coder decoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	convenience init() {
		self.init(frame: UIScreen.main.bounds)
	}
}
