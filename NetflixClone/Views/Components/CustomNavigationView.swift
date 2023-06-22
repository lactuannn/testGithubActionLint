//
//  CustomNavigationView.swift
//  NetflixClone
//
//  Created by DuongNV4.DLS on 29/05/2023.
//

import SwiftUI

struct CustomNavigationView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Gửi 1")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                Spacer()
                HStack(spacing: 20) {
                    Image(systemName: "heart.fill")
                        .font(.title3)
                    Image(systemName: "play.fill")
                        .font(.title3)
                    Image("1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipShape(Rectangle())
                }
                .padding(.bottom, 5)
            }
            .padding(.horizontal)
            .foregroundColor(.white)
        }
//        .background(Color.red)
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            CustomNavigationView()
        }
    }
}
