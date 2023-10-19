import SwiftUI

struct ColorSelector: View {
	let options = BlockColorOption.allCases
	@EnvironmentObject var publisher: UIPublisher

	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack {
				ForEach(options, id: \.self) { option in
					ColorSelectionButton(color: option.color)
				}
			}
			.padding()
		}
	}
}
