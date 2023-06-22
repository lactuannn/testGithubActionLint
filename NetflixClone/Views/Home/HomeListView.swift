//
//  HomeListView.swift
//  NetflixClone
//
//  Created by DuongNV4.DLS on 29/05/2023.
//

import SwiftUI

struct HomeListView: View {

    @State private var images: [Image] = [Image("sample"),
                                          Image("sample"),
                                          Image("sample"),
                                          Image("sample"),
                                          Image("sample"),
                                          Image("sample")]

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("Section title")
                        .foregroundColor(.white)
                        .font(.footnote)
                        .fontWeight(.bold)
                }
                .padding(.leading, 2)

                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(0...10, id: \.self) { item in
                            Image("sample")
                                .resizable()
                                .scaledToFill()
                                .clipShape(Rectangle())
//                                .frame(width: 120, height: 120)
                        }
                    }
                }
                .frame(height: 200)
            }
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
