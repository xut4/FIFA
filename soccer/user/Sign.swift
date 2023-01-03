//
//  SignView.swift
//  soccer
//
//  Created by User05 on 2022/12/21.
//

import SwiftUI

import Foundation
struct SignRes: Codable {
    let status, message: String
    let data: DataClass
}
struct DataClass: Codable {
    let token: String
}
struct SignUserBody: Encodable {
    let name: String
    let email: String
    let password: String
    let passwordConfirm: String
}
class Sign {
    static let shared = Sign()
    let baseURL = URL(string: "http://api.cup2022.ir/api/v1/user")!
    func fetchFavorites(Name:String,Email:String,Password:String,PasswordConfirm:String,completion: @escaping (Result<SignRes, Error>) -> Void) {
        var request = URLRequest(url: baseURL)
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
        ]
        let encoder = JSONEncoder()
        let user = SignUserBody(name: Name, email: Email,password:Password,passwordConfirm:PasswordConfirm)
        let data = try? encoder.encode(user)
        print(String(data: data!, encoding: .utf8)!)
        request.httpBody = data
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data=data {
                do {
                    let dic = try JSONDecoder().decode(SignRes.self, from:data)
                    print(dic)
                    mine.token=dic.data.token
                    completion(.success(dic))

                } catch {
                    do{
                        SignError = try JSONDecoder().decode(UserError.self, from:data)
                        print(SignError)
                        completion(.failure(error))
                        
                    } catch {
                        print(error)
                    }
                }
            }
        }.resume()
    }
}

