import SwiftUI

struct AppStartView: View {
	@StateObject var publisher = UIPublisher()

	var body: some View {
		GeometryReader { geometry in
			ZStack(alignment: .bottom) {
				GameView(publisher: publisher)
					.ignoresSafeArea()

				HUDView(selection: $publisher.color)
					.frame(height: geometry.size.height*0.2)
			}
			.ignoresSafeArea()
		}
		.ignoresSafeArea()
	}
}
