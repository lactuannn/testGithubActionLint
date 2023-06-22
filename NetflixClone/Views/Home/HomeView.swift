//
//  HomeView.swift
//  NetflixClone
//
//  Created by DuongNV4.DLS on 29/05/2023.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    CustomNavigationView()
                    ScrollView {
                        VStack(spacing: 30) {
                            // Header Image
                            TopMovieView(movie: viewModel.popularMovies.first ?? Movie(adult: false, backdropPath:  "/6l1SV3CWkbbe0DcAK1lyOG8aZ4K.jpg", genreIDS: [
                                28,
                                80,
                                53
                            ], id: 385687, originalLanguage: .en, originalTitle: "Fast X", overview: "Over many missions and against impossible odds", popularity: 8893.249, posterPath: "/fiVW06jE7z9YnO4trhaMEdclSiC.jpg", releaseDate: "2023-05-17", title: "Fast X", video: false, voteAverage: 7.3, voteCount: 1771))
                                .padding(.top)

                            // Cell
                            LazyVStack(spacing: 15) {
                                ForEach(0...7, id: \.self) { _ in
                                    HomeListView()
                                }
                            }
                        }
                    }
                }
            }
            .alert(isPresented: $viewModel.isShowError) {
                Alert(title: Text("Error"),
                      message: Text(viewModel.errorMessage))
            }
        }
        .onAppear {
            self.viewModel.apply(.onAppear)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init())
    }
}
