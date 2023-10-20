import Foundation
import SwiftUI

/// Handles the User Interface's state and communication between User Interface and Augmented Reality logic
final class UIPublisher: ObservableObject {
	// Properties for holding UI State
	@Published var isDeleteBlockSelected = false
	@Published var isSelectorSelected = false
	@Published var isBuildSelected = false
	@Published var hasSelection = false
	@Published var color: UIColor? = .init(Color.red)

	// Properties for presenting modals
	@Published var showList = false
	@Published var showSaveModal = false

	/// Holds which game action is currently selected by the user
	var action = GameAction.placeBlock(options: .init(color: UIColor(Color.red)))

	/// Holds the selected construction, the one that will be built with the hammer tool
	lazy var construction = ConstructionData()

	// Functions that run when a certain button is tapped
	func didSelectColor(color: UIColor) {
		self.color = color
		isDeleteBlockSelected = false
		isSelectorSelected = false
		isBuildSelected = false
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
