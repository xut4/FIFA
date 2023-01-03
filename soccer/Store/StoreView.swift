//
//  messi.swift
//  soccer
//
//  Created by User05 on 2022/12/30.
//

import SwiftUI

struct StoreView: View {
    
    @EnvironmentObject var saver: Saver
    var body: some View {
        VStack{
            Text("Love Percentage Stored")
            List {
                ForEach(saver.items) { item in
                    StoreRow(item: item)
                }
                .onDelete { indexSet in
                    saver.items.remove(atOffsets: indexSet)
                }
            }
        }
    }
}

struct messi_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
            .environmentObject(Saver())
    }
}
