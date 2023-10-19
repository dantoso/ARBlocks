import SwiftUI

struct SaveButton: View {
	@EnvironmentObject var publisher: UIPublisher

	var body: some View {
		Button(action: {
			publisher.showSaveModal = true
		}, label: {
			Image(systemName: "square.and.arrow.down")
				.resizable()
				.frame(width: 50, height: 50)
				.foregroundStyle(publisher.hasSelection ? .blue : .gray)
				.padding()
				.background {
					RoundedRectangle(cornerRadius: 15)
						.foregroundStyle(.background)
						.opacity(publisher.hasSelection ? 1 : 0.5)
				}
		})
		.disabled(!publisher.hasSelection)
	}
}
