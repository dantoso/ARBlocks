import SwiftUI

struct ColorSelector: View {
	let colors: [Color] = [.red, .yellow, .green, .blue, .purple]
	@EnvironmentObject var publisher: UIPublisher

	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack {
				ForEach(colors, id: \.description) { color in
					ColorSelectionButton(color: color)
				}
			}
			.padding()
		}
	}
}
