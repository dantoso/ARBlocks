import SwiftUI

struct HUDView: View {
	@ObservedObject var publisher: UIPublisher

	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 10)
				.foregroundStyle(.bar)

			ScrollView(.vertical, showsIndicators: false) {
				VStack(alignment: .leading, spacing: 10) {
					ColorSelector()

					ScrollView(.horizontal, showsIndicators: false) {
						HStack {
							SelectButton()
							DeleteButton()
						}
						.padding(.horizontal)
					}
					.padding(.bottom)
				}
			}
		}
		.environmentObject(publisher)
	}
}

#Preview {
	HUDView(publisher: .init())
}
