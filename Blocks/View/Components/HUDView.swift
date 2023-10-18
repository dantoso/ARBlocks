import SwiftUI

struct HUDView: View {
	@Binding var selection: UIColor
	let colors: [Color] = [.red, .yellow, .green, .blue, .purple]

    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 10)
				.foregroundStyle(.bar)

			ScrollView(.horizontal) {
				HStack {
					ForEach(colors, id: \.description) { color in
						ColorSelector(selection: $selection, color: color)
					}
				}
				.padding()
			}
		}
    }
}

struct ColorSelector: View {
	@Binding var selection: UIColor
	let color: Color

	var body: some View {
		Button(action: {
			selection = UIColor(color)
		}, label: {
			Rectangle()
				.foregroundStyle(color)
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
				.frame(width: 75, height: 75)
		})
	}
}

#Preview {
	HUDView(selection: .constant(.red))
}
