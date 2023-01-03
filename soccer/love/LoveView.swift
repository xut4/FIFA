//
//  ContentView.swift
//  soccer
//
//  Created by User05 on 2022/12/20.
//

import SwiftUI

struct LoveView: View {
    @State private var percentag = "?"
    @State private var show = false
    @State private var showStore = false
    @State private var fname = ""
    @State private var sname = ""
    @EnvironmentObject var saver: Saver
    //var per: Stored
    //var showSaveIcon = true
    var body: some View {
        ZStack{
            Image("heartbg").resizable().opacity(0.3).scaledToFill()
            VStack {
                Text("your love percentage")
                    .font(.custom("ProFontForPowerline-Bold", size: 70))
                    .foregroundColor(Color("fiia")).padding(.bottom, 100.0)
                Text("除了和喜愛的球員算，\n也可以和心愛的人<3")
                    .font(.custom("Nagurigaki-Crayon", size: 30))
                    .foregroundColor(Color(hue: 0.671, saturation: 0.815, brightness: 0.463))
                HStack{
                    Image(systemName:"person.fill")
                    TextField("YourName", text: $fname)
                        .frame(width: 120.0, height: 50.0)
                        .overlay(textFieldBorder)
                    
                }
                HStack{
                    Image(systemName:"person")
                    TextField("OtherName", text: $sname)
                        .frame(width: 120.0, height: 50.0)
                        .overlay(textFieldBorder)
                }
                HStack{
                    Text("love%: ").font(.custom("Nagurigaki-Crayon", size: 50))
                        .foregroundColor(Color("fiia"))
                    if(show){
                        ProgressView()
                    }
                    else{
                        Text(percentag).font(.custom("ProFontForPowerline-Bold", size: 50))
                            .foregroundColor(Color.white)
                        
                    }
                    Text(" %")
                        .font(.custom("Nagurigaki-Crayon", size: 50))
                        .foregroundColor(Color("fiia"))
                    if(showStore){
                        Text("收藏此答案")
                            .onTapGesture {
                                saver.items.append(Stored( fname:fname,sname:sname,per:percentag))
                                }
                            
                    }
                }.environmentObject(saver)
                
                Button {
                    show=true
                    lovePercentage.shared.fetchFavorites(sname: sname.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!, fname: fname.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) { result in
                        switch result {
                        case .success(let favorites):
                            print(favorites)
                            show=false
                            showStore=true
                            percentag=favorites.percentage
                        case .failure(let error):
                            print(error)
                        }
                    }
                } label: {
                    Text("go")
                        .font(.custom("ProFontForPowerline-Bold", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding().background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("fiia")/*@END_MENU_TOKEN@*/)
                }
                .mask(
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                )
            }
        }
        
    }
    var textFieldBorder: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color.blue, lineWidth: 1)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoveView()
    }
}
