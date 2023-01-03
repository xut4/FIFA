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
    var body: some View {
        HStack{
            Text(item.fname + "♡" + item.sname)
            Spacer()
            Text(item.per + "%")
        }
    }
}

struct StoreRow_Previews: PreviewProvider {
    static var previews: some View {
        StoreRow( item: Stored(fname: "蔡淳佳", sname: "有一天我會",per:"rvr")).environmentObject(Saver())
    }
}
