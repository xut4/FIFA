//
//  Data.swift
//  soccer
//
//  Created by User05 on 2022/12/23.
//

import Foundation
class UserData{
    var token: String = ""
}
struct UserError: Codable {
    let status: String
    let message: String
}
struct Stored:Codable ,Identifiable{
    var id = UUID()
    let fname:String
    let sname:String
    let per:String
}
var SignError=UserError(status:"",message:"")
var LoginError=UserError(status:"",message:"")
var mine=UserData()
var fifaTeam=Team()
var fifaMatch=Match()
let month=["January":1,"February":2,"March ":3,"April":4,"May":5,"June":6,"July":7,"August":8,"September":9,"October":10,"November":11,"December":12,]
