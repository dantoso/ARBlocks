import SwiftUI

@main
struct BlocksApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
			GameView()
				.ignoresSafeArea()
        }
    }
}
