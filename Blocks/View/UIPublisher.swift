import Foundation
import SwiftUI

enum GameAction {
	case placeBlock(options: BlockCreationOptions)
	case deleteBlock
	case selectBlock
}

final class UIPublisher: ObservableObject {
	@Published var action = GameAction.placeBlock(options: .init(color: UIColor(Color.red)))
	@Published var color: UIColor? = .init(Color.red)
}
