import SwiftUI

/// Colors available for block building
enum BlockColorOption: String, CaseIterable {
	case red, yellow, green, blue, purple

	var uiColor: UIColor { UIColor(color) }

	var color: Color {
		switch self {
		case .red:
			return .red
		case .yellow:
			return .yellow
		case .green:
			return .green
		case .blue:
			return .blue
		case .purple:
			return .purple
		}
	}

	init(color: UIColor) {
		let option = BlockColorOption.allCases.first { $0.uiColor == color }
		self = option ?? .red
	}
}
