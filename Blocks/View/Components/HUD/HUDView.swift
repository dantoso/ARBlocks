import SwiftUI

struct HUDView: View {
	@ObservedObject var publisher: UIPublisher

	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 10)
				.foregroundStyle(.bar)

			ScrollView(.vertical, showsIndicators: false) {
				VStack(spacing: 10) {
					ColorSelector(selection: $publisher.color)
					
				}
			}
		}
	}
}

#Preview {
	HUDView(publisher: .init())
}
