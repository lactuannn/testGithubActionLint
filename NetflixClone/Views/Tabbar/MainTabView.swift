//
//  TabView.swift
//  NetflixClone
//
//  Created by DuongNV4.DLS on 29/05/2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView(viewModel: .init())
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
                .toolbarBackground(Color.black, for: .tabBar)

            Text("Notifications")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)

            Text("Notifications")
                .tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)

            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)

            Text("Notifications")
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
        }
        .accentColor(.white)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
