 import SwiftUI

struct GameView: UIViewControllerRepresentable {
	func makeUIViewController(context: Context) -> GameViewController {
		return GameViewController()
	}
	
	func updateUIViewController(_ uiViewController: GameViewController, context: Context) { }
}
