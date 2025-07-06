import SwiftUI

struct UpcomingView: View {
    @StateObject private var viewModel = MovieViewModel()
    let imageBaseUrl = "https://image.tmdb.org/t/p/w500"
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea() // Full background
                
                if viewModel.upcomingMovies.isEmpty {
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(0..<6, id: \.self) { _ in
                                ShimmerMoviePlaceholder()
                            }
                        }
                        .padding()
                    }
                } else {
                    List(viewModel.upcomingMovies) { movie in
                        UpcomingMovieRow(movie: movie, imageBaseUrl: imageBaseUrl)
                            .listRowBackground(Color.black) // Black for each row
                    }
                    .scrollContentBackground(.hidden) // So background doesn't override
                }
            }
            

            .navigationTitle("Upcoming")
            .navigationBarTitleDisplayMode(.large)
        }.task {
            await viewModel.loadUpcomingMovies()
        }
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

struct UpcomingMovieRow: View {
    let movie: Movies
    let imageBaseUrl: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: imageBaseUrl + (movie.poster_path ?? ""))) { phase in
                switch phase {
                case .empty:
                   
                    ShimmerMoviePlaceholder()
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
                Spacer()
                Text(movie.title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text("Release: \(movie.release_date ?? "")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
