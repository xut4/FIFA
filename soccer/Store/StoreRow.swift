//
//  StoreRow.swift
//  soccer
//
//  Created by User05 on 2023/1/3.
//

import SwiftUI

struct StoreRow: View {
    @EnvironmentObject var saver: Saver
    var item: Stored
    private let url = URL(string:"https://github.com/xut4/FIFA")
    var body: some View {
        HStack{
            Text(item.fname + "♡" + item.sname)
            Spacer()
            Text(item.per + "%")
            if #available(iOS 16.0, *) {
                ShareLink(item: item.fname + "♡" + item.sname + ":" + item.per + "%") {
                    Image( systemName: "square.and.arrow.up")
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

struct StoreRow_Previews: PreviewProvider {
    static var previews: some View {
        StoreRow( item: Stored(fname: "蔡淳佳", sname: "有一天我會",per:"rvr")).environmentObject(Saver())
    }
}
