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

		case .build:
			build(results: results)
		}
	}

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

			uiPublisher.construction.didSelectBlock(model: model)

			sceneView.didTapNode(node: result.node)

			uiPublisher.hasSelection = uiPublisher.construction.blockCount() > 0
			return
		}
	}

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
