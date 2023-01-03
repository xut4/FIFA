//
//  TeamDetail.swift
//  soccer
//
//  Created by User05 on 2022/12/24.
//

import SwiftUI
import Kingfisher

struct TeamDetail: View {
    let team: TeamData
    var body: some View {
        VStack(alignment: .leading){
            HStack{
            let url = URL(string:team.flag)
            KFImage(url)
                .resizable()
                .scaledToFit()
                .frame( height: 50.0).padding()
            Text(team.nameEn)
                .font(.largeTitle).rotation3DEffect(.degrees(30), axis: (x: 1, y: 0, z: 0))
            }
            Text("勝局："+team.w)
            Text("敗局："+team.l)
            Text("平手："+team.d)
            Text("積分："+team.pts)
            Text("進球："+team.gf)
            Text("失球："+team.ga)
            Text("淨勝："+team.gd)
        }
    }
}

struct TeamDetail_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetail(team: TeamData(teamID:"1", mp:"", w:"", l:"",pts:"", gf:"", ga:"", gd:"",d:"", nameFa:"", nameEn:"QQ",flag:"https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Qatar.svg/125px-Flag_of_Qatar.svg.png"))
    }
}
