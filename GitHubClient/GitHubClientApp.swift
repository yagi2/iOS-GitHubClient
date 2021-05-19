import SwiftUI

@main
struct GitHubClientApp: App {
    var body: some Scene {
        WindowGroup {
            RepoListView()
                .preferredColorScheme(.light)
        }
    }
}
