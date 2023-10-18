 import SwiftUI

struct GameView: UIViewControllerRepresentable {
	@ObservedObject var publisher: UIPublisher

	func makeUIViewController(context: Context) -> GameViewController {
		return GameViewController(uiPublisher: publisher)
	}
	
	func updateUIViewController(_ uiViewController: GameViewController, context: Context) { }
}
