import SwiftUI

struct ConstructionList: View {
	let repository: ConstructionRepository
	@State var constructions: [ConstructionData] = []

	@EnvironmentObject var publisher: UIPublisher

	var body: some View {
		List {
			ForEach(constructions.indices, id: \.self) { index in
				let data = constructions[index]

				Button(data.name) {
					publisher.loadConstruction(data: data)
				}
			}
		}
		.task {
			constructions = repository.getAllConstructions()
		}
	}
}
