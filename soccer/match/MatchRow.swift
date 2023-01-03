//
//  MatchRow.swift
//  soccer
//
//  Created by User05 on 2022/12/23.
//

import SwiftUI
import Kingfisher

struct MatchRow: View {
    let match: Datum
    var body: some View {
        VStack{
            HStack {
                let url = URL(string:match.homeFlag)
                KFImage(url)
                    .resizable()
                    .scaledToFit()
                    .frame( width: 100.0, height: 40.0).padding(.horizontal)
                let url2 = URL(string:match.awayFlag)
                KFImage(url2)
                    .resizable()
                    .scaledToFit()
                    .frame( width: 100.0, height: 40.0).padding(.horizontal)
            }
        }.frame(width: UIScreen.main.bounds.width-50,height: 100.0).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.757, saturation: 0.159, brightness: 0.809)/*@END_MENU_TOKEN@*/).cornerRadius(150)
        HStack {
            Text( "\(match.awayScore)")
                .font(.custom("Nagurigaki-Crayon", size: 50))
                .foregroundColor(Color("fiia"))
                .frame(width: 120.0, height: 80.0)
            Spacer()
            Text("vs").font(.custom("Nagurigaki-Crayon", size: 50))
            Spacer()
            Text("\(match.homeScore)")
                .font(.custom("Nagurigaki-Crayon", size: 50))
                .foregroundColor(Color("fiia"))
                .frame(width: 120.0, height: 80.0)
        }//.frame(width: 200.0, height: 80.0)
    }
}


struct MatchRow_Previews: PreviewProvider {
    static var previews: some View {
        MatchRow(match:Datum(id: "String",awayScore: 2,awayScorers: ["String"],awayTeamID:"", finished:"", group:"",homeScore: 23,homeScorers: ["String"],homeTeamID:"", datumID:"", localDate:"", matchday:"",persianDate:"", stadiumID:"", timeElapsed:"", type: "",homeTeamFa:"", awayTeamFa:"", homeTeamEn:"yyr", awayTeamEn:"erterte",homeFlag:"https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Flag_of_Senegal.svg/125px-Flag_of_Senegal.svg.png", awayFlag: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/125px-Flag_of_the_Netherlands.svg.png"))
    }
}
