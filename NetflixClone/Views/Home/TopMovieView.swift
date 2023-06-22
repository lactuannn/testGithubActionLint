//
//  TopMovieView.swift
//  NetflixClone
//
//  Created by DuongNV4.DLS on 29/05/2023.
//

import SwiftUI
import Kingfisher
import SkeletonUI

struct Constants {
    static let BASE_IMAGE_PATH = "https://image.tmdb.org/t/p/original"
}

struct abcsf_fdafds111dasfd {
    
}

struct TopMovieView: View {

    @State var movie: Movie

    @State private var categories = ["Action",
                                     "Comedy",
                                     "Scene"]

    private func isLastCategory(_ cat: String) -> Bool {
        let count = categories.count
        if let index = categories.firstIndex(of: cat) {
            if index + 1 != count {
                return false
            }
        }
        return true
    }

    var body: some View {
        ZStack {
            KFImage(URL(string: Constants.BASE_IMAGE_PATH + movie.posterPath)!)
                .forceRefresh(true)
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(color: Color.black.opacity(0.6), radius: 10, x: 5, y: 2)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 0.5)
                )

            LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.1),
                                                       Color.black.opacity(0.8)]),
                           startPoint: .top,
                           endPoint: .bottom
            )

            VStack {
                
                Spacer()

                HStack {
                    Image("logoNetflix")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                    Text("Loạt phim")
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.bottom,-10)

                Text(movie.originalTitle)
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)

                HStack {
                    ForEach(categories, id: \.self) { cate in
                        HStack {
                            Text(cate)
                                .font(.footnote)
                                .fontWeight(.bold)
                            if !isLastCategory(cate) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 4))
                            }
                        }
                    }
                }

                // Buttons
                HStack(spacing: 20) {

                    WhiteButtonView(text: "Play",
                                    imageName: "play.fill") {
                        //
                    }
                                    .frame(width: 140)
                                    .padding(.bottom)

                    Button {
//                        action()
                    } label: {

                        HStack {
                            Spacer()
                            Image(systemName: "plus")
                                .font(.title3)

                            Text("Favorite")
                                .font(.subheadline)
                                .bold()
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .foregroundColor(.white)
                        .background(.gray.opacity(0.7))
                        .cornerRadius(3)
                        .frame(width: 140)
                        .padding(.bottom)
                    }
                }
            }
            .foregroundColor(.white)

        }
        .frame(width: UIScreen.main.bounds.width - 50, height: 450)

    }
}

struct TopMovieView_Previews: PreviewProvider {
    static var previews: some View {
        TopMovieView(movie: Movie(adult: false, backdropPath:  "/6l1SV3CWkbbe0DcAK1lyOG8aZ4K.jpg", genreIDS: [
            28,
            80,
            53
        ], id: 385687, originalLanguage: .en, originalTitle: "Fast X", overview: "Over many missions and against impossible odds", popularity: 8893.249, posterPath: "/fiVW06jE7z9YnO4trhaMEdclSiC.jpg", releaseDate: "2023-05-17", title: "Fast X", video: false, voteAverage: 7.3, voteCount: 1771))
    }
}
