import SwiftUI

struct AppStartView: View {
	@StateObject var publisher = UIPublisher()
	let repository = ConstructionRepository()

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

				VStack {
					HStack {
						ShowConstructionsButton(shoudlShow: $publisher.showList)
							.padding(.top, 50)
							.padding()
						Spacer()
					}
					Spacer()
				}
			}
			.ignoresSafeArea()
		}
		.ignoresSafeArea()
		.sheet(isPresented: $publisher.showList) {
			ConstructionList(repository: repository)
				.environmentObject(publisher)
		}
		.sheet(isPresented: $publisher.showSaveModal) {
			SaveView(publisher: publisher, repository: repository)
		}
	}
}
