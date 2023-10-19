import SwiftUI

struct ShowConstructionsButton: View {
	@Binding var shoudlShow: Bool

	var body: some View {
		Button(action: {
			shoudlShow = true
		}, label: {
			Image(systemName: "folder")
				.frame(width: 20, height: 20)
				.padding(15)
				.background {
					RoundedRectangle(cornerRadius: 15)
						.foregroundStyle(.background)
				}
		})
	}
}
