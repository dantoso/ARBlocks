import SceneKit

final class ConstructionData {
	private var construction: [BlockModel] = []
	private var initalPosition: SCNVector3 = .init(x: 0, y: 0, z: 0)

	func addNewBlock(model: BlockModel) {
		if construction.isEmpty {
			initalPosition = model.position
		}

		let relativePosition = SCNVector3(
			model.position.x - initalPosition.x,
			model.position.y - initalPosition.y,
			model.position.z - initalPosition.z
		)

		let newBlock = BlockModel(position: relativePosition, color: model.color)
		construction.append(newBlock)
	}

	func loadConstructionData(from position: SCNVector3) -> [BlockModel] {
		let data = construction.map { block in
			let absolutePosition = SCNVector3(
				block.position.x + position.x,
				block.position.y + position.y,
				block.position.z + position.z
			)

			return BlockModel(position: absolutePosition, color: block.color)
		}

		return data
	}

	func saveCurrentConstruction() {
		// TODO: implement this later
	}

	func reset() {
		construction = []
		initalPosition = .init(x: 0, y: 0, z: 0)
	}
}
