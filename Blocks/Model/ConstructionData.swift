import SceneKit

final class ConstructionData {
	var name: String = ""
	private var construction: Set<BlockModel> = []
	private var initalPosition: SCNVector3 = .init(x: 0, y: 0, z: 0)

	init() { }

	init(construction: CDConstruction) {
		let blocks = construction.blocks?.map { block in
			return BlockModel(block: block)
		}

		self.construction = Set(blocks ?? [])
		self.initalPosition = .init(
			x: construction.initialX,
			y: construction.initialY,
			z: construction.initialZ
		)
		self.name = construction.name ?? ""
	}

	func didSelectBlock(model: BlockModel) {
		if construction.isEmpty {
			initalPosition = model.position
		}

		let relativePosition = SCNVector3(
			model.position.x - initalPosition.x,
			model.position.y - initalPosition.y,
			model.position.z - initalPosition.z
		)

		let newBlock = BlockModel(position: relativePosition, color: model.color.uiColor)

		let result = construction.insert(newBlock)

		if !result.inserted {
			let oldMember = result.memberAfterInsert
			construction.remove(oldMember)
		}
	}

	func loadConstructionData(from position: SCNVector3) -> [BlockModel] {
		let data = construction.map { block in
			let absolutePosition = SCNVector3(
				block.position.x + position.x,
				block.position.y + position.y,
				block.position.z + position.z
			)

			return BlockModel(position: absolutePosition, color: block.color.uiColor)
		}

		return data
	}

	func blockCount() -> Int {
		return construction.count
	}

	func exportConstruction() -> (name: String, blocks: [BlockModel], initialPosition: SCNVector3) {
		return (name, Array(construction), initalPosition)
	}

	func reset() {
		construction = []
		initalPosition = .init(x: 0, y: 0, z: 0)
	}
}
