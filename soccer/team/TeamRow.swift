//
//  TeamRow.swift
//  soccer
//
//  Created by User05 on 2022/12/23.
//

import SwiftUI
import Kingfisher

struct TeamRow: View {
    
    var team: TeamData
    var body: some View {
        HStack{
            let url = URL(string:team.flag)
            KFImage(url)
                .resizable()
                .scaledToFit()
                .frame( width: 80.0, height: 30.0).padding()
            VStack(alignment: .leading) {
                Text(team.nameEn)
                    .font(.custom("ProFontForPowerline-Bold", size: 30))
            }
        }//.environmentObject(saver)
    }
}

struct TeamRow_Previews: PreviewProvider {
    static var previews: some View {
        TeamRow(team: TeamData(teamID:"1", mp:"", w:"", l:"",pts:"", gf:"", ga:"", gd:"",d:"", nameFa:"", nameEn:"QQ",flag:"https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Qatar.svg/125px-Flag_of_Qatar.svg.png",isSave: false))
    }
}
