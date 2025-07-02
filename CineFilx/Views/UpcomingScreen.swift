import SwiftUI

struct UpcomingView: View {
    // Dummy data
    let upcomingMovies: [MovieUpcoming] = [
        MovieUpcoming(title: "Deadpool 3", posterURL: Constants.deadpool2, releaseDate: "2025-07-25", genre: "Action"),
        MovieUpcoming(title: "Inside Out 2", posterURL: Constants.insideOut , releaseDate: "2025-08-10", genre: "Animation"),
        MovieUpcoming(title: "Minnal murali", posterURL: Constants.batman2, releaseDate: "2025-09-18", genre: "Thriller")
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(upcomingMovies) { movie in
                    HStack(alignment: .top, spacing: 16) {
                        AsyncImage(url: URL(string: movie.posterURL)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 100, height: 150)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 150)
                                    .clipped()
                                    .cornerRadius(10)
                            case .failure:
                                Image(systemName: "film")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 150)
                                    .foregroundColor(.gray)
                            @unknown default:
                                EmptyView()
                            }
                        }

                        VStack(alignment: .leading, spacing: 6) {
                            Text(movie.title)
                                .font(.headline)
                                .foregroundColor(.white)

                            Text("Release: \(movie.releaseDate)")
                                .font(.subheadline)
                                .foregroundColor(.gray)

                            Text("Genre: \(movie.genre)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Upcoming")
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .black
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}
