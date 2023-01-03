//
//  soccerApp.swift
//  soccer
//
//  Created by User05 on 2022/12/20.

import SwiftUI

@main
struct soccerApp: App {
    @State var showflag = 0
    var body: some Scene {
        WindowGroup {
            if showflag==0 {
                LoginView(showflag: $showflag)
            }
            else if showflag==1{
                SignView(showflag: $showflag)
            }
            else {
                SecondView().environmentObject(Saver())
                    .environmentObject(Team())
            }
        }
    }
}
