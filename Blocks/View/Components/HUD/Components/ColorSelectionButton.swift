import SwiftUI

struct ColorSelectionButton: View {
	@Binding var selection: UIColor?
	let color: Color

	var body: some View {
		Button(action: {
			selection = UIColor(color)
		}, label: {
			Rectangle()
				.foregroundStyle(color)
				.frame(width: 50, height: 50)
				.padding()
				.background {
					if selection == UIColor(color) {
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
