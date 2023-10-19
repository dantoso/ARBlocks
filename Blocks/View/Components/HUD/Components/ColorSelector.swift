import SwiftUI

struct ColorSelector: View {
	@Binding var selection: UIColor?
	let colors: [Color] = [.red, .yellow, .green, .blue, .purple]

	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack {
				ForEach(colors, id: \.description) { color in
					ColorSelectionButton(selection: $selection, color: color)
				}
			}
			.padding()
		}
	}
}
