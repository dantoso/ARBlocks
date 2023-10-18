import Foundation
import SwiftUI

final class UIPublisher: ObservableObject {
	@Published var color: UIColor = UIColor(Color.red)
	
	func generateOptions() -> BlockCreationOptions {
		var options = BlockCreationOptions()
		options.color = color

		return options
	}
}
