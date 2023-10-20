import SwiftUI

/// The construction saving modal
struct SaveView: View {
	@State var name: String = ""

	@ObservedObject var publisher: UIPublisher
	let repository: ConstructionRepository

	var body: some View {
		VStack(alignment: .trailing) {
			Button("Save") {
				publisher.construction.name = name
				repository.saveConstruction(construction: publisher.construction)
				publisher.showSaveModal = false
			}
			.padding()

			Form {
				TextField("Name", text: $name, prompt: Text("Give a name to your building!"))
			}
		}
	}
}

#Preview {
	SaveView(publisher: .init(), repository: .init())
}
