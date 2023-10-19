import Foundation
import SwiftUI

final class UIPublisher: ObservableObject {
	@Published var isDeleteBlockSelected = false
	@Published var isSelectorSelected = false
	@Published var color: UIColor? = .init(Color.red)
	var action = GameAction.placeBlock(options: .init(color: UIColor(Color.red)))

	func didSelectColor(color: UIColor) {
		self.color = color
		isDeleteBlockSelected = false
		isSelectorSelected = false
		action = .placeBlock(options: .init(color: color))
	}

	func didTapDelete() {
		isDeleteBlockSelected = true
		isSelectorSelected = false
		color = nil
		action = .deleteBlock
	}

	func didTapSelect() {
		isSelectorSelected = true
		color = nil
		isDeleteBlockSelected = false
		action = .selectBlock
	}
}
