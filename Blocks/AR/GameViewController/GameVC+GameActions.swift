import SceneKit

/// This file declares the funcitons that run when a user touches the AR view
extension GameViewController {

	/// Consults the UIPublisher to know which game action is to be executed at a certain point on the screen
	func executeActionAt(location: CGPoint) {
		let results = sceneView.hitTest(location, options: [.searchMode: 1])

		switch uiPublisher.action {
		case .placeBlock(options: let options):
			placeBlock(results: results, options: options)

		case .deleteBlock:
			deleteBlock(results: results)

		case .selectBlock:
			selectBlock(results: results)

		case .build:
			build(results: results)
		}
	}

	/// Tries to find a plane or block where the user touched to place a block on, if found, places a block on top of it
	func placeBlock(results: [SCNHitTestResult], options: BlockCreationOptions) {
		for result in results {
			switch result.node.name {
			case "myPlane":
				let normal = result.worldNormal

				var position = result.worldCoordinates
				position.y += 0.04 * normal.y
				position.x += 0.04 * normal.x
				position.z += 0.04 * normal.z

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

	/// Tries to find a block where the user touched to be removed from the scene
	func deleteBlock(results: [SCNHitTestResult]) {
		for result in results {
			guard result.node.name == "myBlock" else { continue }
			sceneView.removeBox(node: result.node)
			return
		}
	}

	/// Tries to find a block where the user touched for it to be selected and stored in a construction data object
	func selectBlock(results: [SCNHitTestResult]) {
		for result in results {
			guard 
				result.node.name == "myBlock",
				let color = result.node.geometry?.firstMaterial?.diffuse.contents as? UIColor
			else { continue }

			let model = BlockModel(position: result.node.position, color: color)

			uiPublisher.construction.didSelectBlock(model: model)

			sceneView.didTapNode(node: result.node)

			uiPublisher.hasSelection = uiPublisher.construction.blockCount() > 0
			return
		}
	}

	/// Tries to find a plane or block where the user touched to place a construction on, if found, places a construction on top of it
	func build(results: [SCNHitTestResult]) {
		for result in results {
			switch result.node.name {
			case "myPlane":
				let position = result.worldCoordinates
				let data = uiPublisher.construction.loadConstructionData(from: position)
				data.forEach { model in
					sceneView.createBox(at: model.position, options: .init(color: model.color.uiColor))
				}
				return

			case "myBlock":
				let normal = result.worldNormal

				var position = result.node.position
				position.y += 0.1 * normal.y
				position.x += 0.1 * normal.x
				position.z += 0.1 * normal.z

				let data = uiPublisher.construction.loadConstructionData(from: position)
				data.forEach { model in
					sceneView.createBox(at: model.position, options: .init(color: model.color.uiColor))
				}
				return

			default:
				continue
			}
		}
	}
}
