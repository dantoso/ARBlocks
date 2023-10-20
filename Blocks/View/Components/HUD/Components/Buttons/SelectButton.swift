import SwiftUI

/// Button for selecting the Select tool
struct SelectButton: View {
	@EnvironmentObject var publisher: UIPublisher

	var body: some View {
		Button(action: {
			publisher.didTapSelect()
		}, label: {
			Image(systemName: "scope")
				.resizable()
				.frame(width: 50, height: 50)
				.foregroundStyle(.blue)
				.padding()
				.background {
					if publisher.isSelectorSelected {
						RoundedRectangle(cornerRadius: 15)
							.foregroundStyle(.foreground)
					} else {
						RoundedRectangle(cornerRadius: 15)
							.foregroundStyle(.background)
					}
				}
		})
	}
}
