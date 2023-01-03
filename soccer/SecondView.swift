//
//  SecondView.swift
//  soccer
//
//  Created by User05 on 2022/12/21.
//

import SwiftUI
import ESTabBarController

struct SecondView: View {
    @StateObject private var saver = Saver()
    @StateObject private var team = Team()
    var body: some View {
        TabView {
            TeamTable()
                .tabItem {
                    Label("soccer"
                          , systemImage: "bolt.heart")
                }.environmentObject(team)
            MatchList(FIFA:fifaMatch)
                .tabItem {
                    Label("match"
                          , systemImage: "bolt.heart")
                }
            LoveView()
                .tabItem {
                    Label("合適指數"
                          , systemImage: "bolt.heart.fill")
                }
            StoreView()
                .tabItem {
                    Label("store"
                          , systemImage: "bolt.heart.fill")
                }
        }.environmentObject(saver)
         .environmentObject(team)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
