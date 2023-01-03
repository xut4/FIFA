//
//  TeamTable.swift
//  soccer
//
//  Created by User05 on 2022/12/24.
//

import SwiftUI

struct TeamTable: View {
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    @EnvironmentObject var FIFA: Team
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            ZStack{
                Image("Image").resizable().opacity(0.3).scaledToFill().frame(minWidth: 0,  maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                VStack{
                    HStack{
                        Text("TEAM")
                            .font(.headline)
                    }
                    List{
                        ForEach(FIFA.data, id: \.group) { c in
                            Section(header: Text(c.group)){
                                ForEach(c.teams.indices){(item) in
                                    NavigationLink(destination:
                                                    TeamDetail(team: c.teams[item])
                                                   , label: {
                                                    TeamRow(team: c.teams[item])
                                                   })
                                }.background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.0, brightness: 0.875)/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            }

                        }.cornerRadius(150)
                    }
                }
            }
            .onAppear {
                FIFA.fetchall() { results in
                    switch results {
                    case .success(let favorites):
                        fifaTeam=FIFA
                    print(favorites)
                    case .failure(let errotr):
                        print(errotr)
                    }
                }
            }
        }
    }
}

struct TeamTable_Previews: PreviewProvider {
    static var previews: some View {
        TeamTable()
    }
}
