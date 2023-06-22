//
//  WhiteButtonView.swift
//  NetflixClone
//
//  Created by DuongNV4.DLS on 29/05/2023.
//

import SwiftUI

struct WhiteButtonView: View {

    var text: String
    var imageName: String

    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {

            HStack {
                Spacer()
                Image(systemName: imageName)
                    .font(.title3)

                Text("Play")
                    .font(.subheadline)
                    .bold()
                Spacer()
            }
            .padding(.vertical, 8)
            .foregroundColor(.black)
            .background(.white)
            .cornerRadius(3)
        }

    }
}

struct WhiteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.brown.ignoresSafeArea()
            WhiteButtonView(text: "Player", imageName: "play.fill") {

            }
        }
    }
}
