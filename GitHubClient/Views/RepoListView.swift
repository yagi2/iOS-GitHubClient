import SwiftUI

struct RepoListView: View {
    @StateObject private var viewModel: RepoListViewModel
    
    init(viewModel: RepoListViewModel = RepoListViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.repos {
                case .idle, .loading:
                    ProgressView("loading...")
                case .failed:
                    VStack {
                        Group {
                            Image("GitHubMark")
                            Text("Failed to load repositories")
                                .padding(.top, 4)
                        }
                        .foregroundColor(.black)
                        .opacity(0.4)
                        Button(
                            action: {
                                viewModel.onRetryButtonTapped()
                            },
                            label: {
                                Text("Retry")
                                    .fontWeight(.bold)
                            }
                        )
                        .padding(.top, 8)
                    }
                case let .loaded(repos):
                    if repos.isEmpty {
                        Text("No repositories")
                            .fontWeight(.bold)
                    } else {
                        List(repos) { repo in
                            NavigationLink(
                                destination: RepoDetailView(repo: repo)) {
                                RepoRowView(repo: repo)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Repositories")
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

struct RepoListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RepoListView(
                viewModel: RepoListViewModel(
                    repoRepository: MockRepoRepository(
                        repos: [ .mock1, .mock2, .mock3, .mock4, .mock5 ]
                    )
                )
            )
            .previewDisplayName("Default")
            
            RepoListView(
                viewModel: RepoListViewModel(
                    repoRepository: MockRepoRepository(
                        repos: []
                    )
                )
            )
            .previewDisplayName("Empty")
            
            RepoListView(
                viewModel: RepoListViewModel(
                    repoRepository: MockRepoRepository(
                        repos: [],
                        error: DummyError()
                    )
                )
            )
            .previewDisplayName("Error")
            
        }
    }
}
