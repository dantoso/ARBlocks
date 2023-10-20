import Foundation

/// An enumeration representing every single action the user can take to interact with the Game's world
enum GameAction {

	/// Place a single block on the world following the associated options variable (which specifies the block's color)
	case placeBlock(options: BlockCreationOptions)

	/// Remove a block from the world
	case deleteBlock

	/// Select or deselect a block
	case selectBlock

	/// Build a selected multiple block structure
	case build
}
