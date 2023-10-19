import Foundation
import SwiftUI

final class UIPublisher: ObservableObject {
	@Published var isDeleteBlockSelected = false
	@Published var isSelectorSelected = false
	@Published var isBuildSelected = false
	@Published var hasSelection = false

	@Published var showList = false
	@Published var showSaveModal = false

	@Published var color: UIColor? = .init(Color.red)

	var action = GameAction.placeBlock(options: .init(color: UIColor(Color.red)))
	lazy var construction = ConstructionData()

	func didSelectColor(color: UIColor) {
		self.color = color
		isDeleteBlockSelected = false
		isSelectorSelected = false
		action = .placeBlock(options: .init(color: color))
	}

	func didTapDelete() {
		isDeleteBlockSelected = true
		isSelectorSelected = false
		isBuildSelected = false
		color = nil
		action = .deleteBlock
	}

	func didTapSelect() {
		isSelectorSelected = true
		isDeleteBlockSelected = false
		isBuildSelected = false
		color = nil
		action = .selectBlock
	}

	func didTapBuild() {
		isBuildSelected = true
		isSelectorSelected = false
		isDeleteBlockSelected = false
		color = nil
		action = .build
	}
}
