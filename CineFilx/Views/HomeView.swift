import SwiftUI

struct HomeView: View {
    let moviePosters = [
        
        Constants.matrixImageMovie,
        Constants.batman2,
        Constants.intestellar,
        Constants.oppenheimer,
        Constants.insideOut,
        Constants.testUrl1,
        Constants.testUrl3
        
    ]
    var testImage = "https://image.tmdb.org/t/p/w500/nnl6OWkyPpuMm595hmAxNW3rZFn.jpg"
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .black
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        
                        ImageCarouselView(imageUrls: moviePosters)
                            .padding(.top)
                            .background(Color.black.ignoresSafeArea())
                        
                        
                        horiztonalListView(header: Constants.lblHeaderTrendingMovies, titles: [
                            
                            Constants.testUrl2,
                            Constants.testUrl1, Constants.ironHeart, Constants.testUrl3,
                            Constants.oppenheimer, Constants.matrixImageMovie, Constants.carImage
                        ])
                        
                        horiztonalListView(header: Constants.lblHeaderTopRatedMovies, titles: [
                            Constants.deadpool2, Constants.matrixImageMovie, Constants.carImage,
                            Constants.testUrl1, Constants.ironHeart, Constants.testUrl3
                        ])
                        
                        horiztonalListView(header: Constants.lblHeaderTrendingTv, titles: [
                            Constants.mobLand, Constants.revial, Constants.ironHeart
                        ])
                    }
                }
            }
            .background(Color.black)
            .ignoresSafeArea()
            .navigationTitle("Home") // White Title
        }
        .navigationViewStyle(StackNavigationViewStyle()) // For iPhone layout consistency
    }
}

#Preview {
    HomeView()
}
