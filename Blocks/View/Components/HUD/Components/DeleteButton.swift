import SwiftUI

struct DeleteButton: View {
	@EnvironmentObject var publisher: UIPublisher

	var body: some View {
		Button(action: {
			publisher.didTapDelete()
		}, label: {
			Image(systemName: "trash")
				.resizable()
				.frame(width: 50, height: 50)
				.foregroundStyle(.red)
				.padding()
				.background {
					if publisher.isDeleteBlockSelected {
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
