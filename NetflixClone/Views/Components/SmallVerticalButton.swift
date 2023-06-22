//
//  SmallVerticalButton.swift
//  NetflixClone
//
//  Created by DuongNV4.DLS on 29/05/2023.
//

import SwiftUI

struct SmallVerticalButton: View {

    var text: String
    var isOnImage: String
    var isOffImage: String
    var isOn: Bool

    var action: () -> Void

    var body: some View {

        Button {

        } label: {
            VStack(spacing: 5) {
                Image(systemName: isOn ? isOnImage : isOffImage)
                    .foregroundColor(.white)

                Text(text)
                    .foregroundColor(.white)
                    .font(.caption2)
                    .fontWeight(.bold)
            }
        }

    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true, action: {
                print("tapped")
            })
        }
    }
}
