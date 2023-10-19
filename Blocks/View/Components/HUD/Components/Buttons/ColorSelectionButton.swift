import SwiftUI

struct ColorSelectionButton: View {
	let color: Color
	@EnvironmentObject var publisher: UIPublisher

	var body: some View {
		Button(action: {
			publisher.didSelectColor(color: UIColor(color))
		}, label: {
			Rectangle()
				.foregroundStyle(color)
				.frame(width: 50, height: 50)
				.padding()
				.background {
					if publisher.color == UIColor(color) {
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
