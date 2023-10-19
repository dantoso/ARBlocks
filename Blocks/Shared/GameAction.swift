import Foundation

enum GameAction {
	case placeBlock(options: BlockCreationOptions)
	case deleteBlock
	case selectBlock
}
