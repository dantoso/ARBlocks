import SceneKit

/// This struct models a single block
struct BlockModel: Hashable {
	let position: SCNVector3
	let color: BlockColorOption

	func hash(into hasher: inout Hasher) {
		hasher.combine(position)
	}

	init(position: SCNVector3, color: UIColor) {
		self.position = position
		self.color = BlockColorOption(color: color)
	}

	init(block: CDBlock) {
		position = .init(x: block.x, y: block.y, z: block.z)
		color = BlockColorOption(rawValue: block.colorRawValue ?? "") ?? .red
	}
}
