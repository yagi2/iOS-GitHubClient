import SwiftUI

struct RepoRowView: View {
    let repo: Repo
    var body: some View {
        HStack {
            Image("GitHubMark")
                .resizable()
                .frame(width: 44, height:44)
            VStack(alignment: .leading) {
                Text(repo.owner.name)
                    .font(.caption)
                Text(repo.name)
                    .font(.body)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct RepoRowView_Previews: PreviewProvider {
    static var previews: some View {
        RepoRowView(repo: .mock1)
    }
}
