import SceneKit

extension GameViewController {
	func executeActionAt(location: CGPoint) {
		let results = sceneView.hitTest(location, options: [.searchMode: 1])

		switch uiPublisher.action {

		case .placeBlock(options: let options):
			placeBlock(results: results, options: options)

		case .deleteBlock:
			deleteBlock(results: results)

		case .selectBlock:
			selectBlock(results: results)
		}
	}

	func placeBlock(results: [SCNHitTestResult], options: BlockCreationOptions) {
		for result in results {
			switch result.node.name {
			case "myPlane":
				let position = result.worldCoordinates
				sceneView.createBox(at: position, options: options)
				return

			case "myBlock":
				let normal = result.worldNormal

				var position = result.node.position
				position.y += 0.1 * normal.y
				position.x += 0.1 * normal.x
				position.z += 0.1 * normal.z

				sceneView.createBox(at: position, options: options)
				return

			default:
				continue
			}
		}
	}

	func deleteBlock(results: [SCNHitTestResult]) {
		for result in results {
			guard result.node.name == "myBlock" else { continue }
			sceneView.removeBox(node: result.node)
			return
		}
	}

	func selectBlock(results: [SCNHitTestResult]) {
		for result in results {
			guard 
				result.node.name == "myBlock",
				let color = result.node.geometry?.firstMaterial?.diffuse.contents as? UIColor
			else { continue }

			let model = BlockModel(position: result.node.position, color: color)
			construction.addNewBlock(model: model)

			// TODO: Change block color to reflect selection
			return
		}
	}
}
