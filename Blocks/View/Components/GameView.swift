 import SwiftUI

/// The game view, wrapping the Game View Controller (a UIKit object) for it to be shown in a SwiftUI interface
struct GameView: UIViewControllerRepresentable {
	@ObservedObject var publisher: UIPublisher

	func makeUIViewController(context: Context) -> GameViewController {
		return GameViewController(uiPublisher: publisher)
	}
	
	func updateUIViewController(_ uiViewController: GameViewController, context: Context) { }
}
