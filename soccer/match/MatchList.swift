//
//  MatchList.swift
//  soccer
//
//  Created by User05 on 2022/12/23.
//

import SwiftUI
struct MatchList: View {
    @EnvironmentObject var team: Team
    @State private var time = Date()
    @ObservedObject var FIFA: Match
    @State private var te = ""
    var dateRange: ClosedRange<Date> {
        DateComponents(calendar: .current, year: 2022, month: 11, day: 21).date!...DateComponents(calendar: .current, year: 2022, month: 12, day: 18).date!
    }
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
    var body: some View {
        VStack{
            HStack{
                Button{
                    FIFA.getAll() { results in
                        switch results {
                        case .success(let favorites):
                        print(favorites)
                        case .failure(let errotr):
                            print(errotr)
                        }
                    }
                }label: {
                    Text("refresh").padding(.all, 5.0).font(.custom("ProFontForPowerline-Bold", size: 20)).foregroundColor(Color.white).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("fiia")/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                DatePicker("日期:\n\(dateFormatter.string(from: time))", selection: $time, in: dateRange, displayedComponents: .date)
                Button{
                    FIFA.fetchDate(bydate:dateFormatter.string(from: time)) { results in
                        switch results {
                        case .success(let favorites): print(favorites)
                        case .failure(let errotr):
                            print(errotr)
                        }
                    }
                } label: {
                    Text("Search").font(.custom("ProFontForPowerline-Bold", size: 20))
                        .foregroundColor(Color("fiia"))
                }
            }
            List{
                if(FIFA.data.isEmpty){
                    Text("none")
                }
                else{
                    ForEach(FIFA.data, id: \.id) { c in
                        Section(header: Text(c.localDate)){
                            MatchRow(match: c)
                        }
                    }
                }
            }
        }
        .onAppear {
            FIFA.getAll() { results in
                switch results {
                case .success(let favorites):
                print(favorites)
                case .failure(let errotr):
                    print(errotr)
                }
            }
        }.padding()
    }
}

struct MatchList_Previews: PreviewProvider {
    static var previews: some View {
        MatchList(FIFA:fifaMatch)
    }
}
