import SwiftUI

struct HUDView: View {
	@State var selection: Color = .green
	let colors = [Color.green, .red, .blue]

    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 25)
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
	@Binding var selection: Color
	let color: Color

	var body: some View {
		Button(action: {
			selection = color
		}, label: {
			Rectangle()
				.foregroundStyle(color)
				.padding()
				.background {
					if selection == color {
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
    HUDView()
}
