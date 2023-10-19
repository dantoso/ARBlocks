import SwiftUI

struct AppStartView: View {
	@StateObject var publisher = UIPublisher()

	var body: some View {
		GeometryReader { geometry in
			ZStack(alignment: .bottom) {
				GameView(publisher: publisher)
					.ignoresSafeArea()

				HUDView(publisher: publisher)
					.frame(height: geometry.size.height*0.25)
					.mask {
						Rectangle()
							.ignoresSafeArea()
							.frame(height: geometry.size.height*0.25)
					}
			}
			.ignoresSafeArea()
		}
		.ignoresSafeArea()
	}
}
