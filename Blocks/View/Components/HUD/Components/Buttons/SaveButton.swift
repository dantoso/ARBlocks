import SwiftUI

struct SaveButton: View {
	@EnvironmentObject var publisher: UIPublisher

	var body: some View {
		Button(action: {
			publisher.didTapSave()
		}, label: {
			Image(systemName: "square.and.arrow.down")
				.resizable()
				.frame(width: 50, height: 50)
				.foregroundStyle(.blue)
				.padding()
				.background {
					RoundedRectangle(cornerRadius: 15)
						.foregroundStyle(.background)
				}
		})
		.disabled(!publisher.hasSelection)
	}
}
