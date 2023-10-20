import SceneKit

/// This class represents a multi-block structure
final class ConstructionData {

	// Properties of a construction
	var name: String = ""

	/// The blocks that make it
	private var construction: Set<BlockModel> = []

	/// The position of the first block in the construction
	private var initalPosition: SCNVector3 = .init(x: 0, y: 0, z: 0)

	init() { }

	/// Initializing a construction from a Core Data (database) entity
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

	/// What happens when the user selects a block with the selection tool
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

	/// Loads the construction data for it to be replicated at a position in the world
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

	/// Returns the block quantity in the construction
	func blockCount() -> Int {
		return construction.count
	}

	/// Exports the construction's data for it to be saved in the database
	func exportConstruction() -> (name: String, blocks: [BlockModel], initialPosition: SCNVector3) {
		return (name, Array(construction), initalPosition)
	}

	/// Resets the construction to initial state
	func reset() {
		construction = []
		initalPosition = .init(x: 0, y: 0, z: 0)
	}
}
