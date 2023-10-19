import SceneKit

struct BlockModel: Hashable {
	let position: SCNVector3
	let color: UIColor

	func hash(into hasher: inout Hasher) {
		hasher.combine(position)
	}
}
