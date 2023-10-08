import SwiftUI

@main
struct BlocksApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
			BlocksViewRepresentable()
				.ignoresSafeArea()
        }
    }
}
