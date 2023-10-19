import SwiftUI

struct BuildButton: View {
	@EnvironmentObject var publisher: UIPublisher

	var body: some View {
		Button(action: {
			publisher.didTapBuild()
		}, label: {
			Image(systemName: "hammer.fill")
				.resizable()
				.frame(width: 50, height: 50)
				.foregroundStyle(.blue)
				.padding()
				.background {
					if publisher.isBuildSelected {
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
