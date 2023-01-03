//
//  ItunesDataSaver.swift
//  ItunesApiCompletionHandler
//
//  Created by Peter Pan on 2022/12/13.
//

import SwiftUI

class Saver: ObservableObject {
    @AppStorage("items") var itemsData: Data?
    
    @Published var items = [Stored]() {
        didSet {
            let encoder = JSONEncoder()
            do {
                itemsData = try encoder.encode(items)
                print(items)
            } catch {
                print(error)
            }
        }
    }
    
    init() {
        if let itemsData = itemsData {
            let decoder = JSONDecoder()
            do {
                items = try decoder.decode([Stored].self, from: itemsData)
            } catch  {
                print(error)
            }
           
        }
    }
    
}
