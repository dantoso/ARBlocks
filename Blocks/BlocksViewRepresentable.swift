 import SwiftUI

struct BlocksViewRepresentable: UIViewRepresentable {
	func makeUIView(context: Context) -> BlocksView {
		return BlocksView()
	}
	
	func updateUIView(_ uiView: BlocksView, context: Context) { }
}
