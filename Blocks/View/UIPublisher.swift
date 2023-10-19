import Foundation
import SwiftUI

enum GameAction {
	case placeBlock(options: BlockCreationOptions)
	case deleteBlock
	case selectBlock
}

final class UIPublisher: ObservableObject {
	@Published var isDeleteBlockSelected = false
	@Published var color: UIColor? = .init(Color.red)
	var action = GameAction.placeBlock(options: .init(color: UIColor(Color.red)))

	func didSelectColor(color: UIColor) {
		self.color = color
		isDeleteBlockSelected = false
		action = .placeBlock(options: .init(color: color))
	}

	func didTapDelete() {
		isDeleteBlockSelected = true
		color = nil
		action = .deleteBlock
	}
}
