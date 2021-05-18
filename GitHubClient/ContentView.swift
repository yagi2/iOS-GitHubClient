import SwiftUI

struct ContentView: View {
    private let mockRepos = [
        Repo(id: 1, name: "Test Repo1", owner: User(name: "Test User1")),
        Repo(id: 2, name: "Test Repo2", owner: User(name: "Test User2")),
        Repo(id: 3, name: "Test Repo3", owner: User(name: "Test User3")),
        Repo(id: 4, name: "Test Repo4", owner: User(name: "Test User4")),
        Repo(id: 5, name: "Test Repo5", owner: User(name: "Test User5"))
    ]
    
    var body: some View {
        List(mockRepos) { repo in
            RepoRowView(repo: repo)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RepoRowView: View {
    let repo: Repo
    var body: some View {
        HStack {
            Image("GitHubMark")
                .resizable()
                .frame(width: 44, height:44)
            VStack(alignment: .leading) {
                Text(repo.name)
                    .font(.caption)
                Text(repo.owner.name)
                    .font(.body)
                    .fontWeight(.semibold)
            }
        }
    }
}
