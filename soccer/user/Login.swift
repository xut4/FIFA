//
//  Login.swift
//  soccer
//
//  Created by User05 on 2022/12/21.
//

import Foundation

struct LoginRes: Codable {
    let status: String
    let data: DataClass
}

struct CreateUserBody: Encodable {
    let email: String
    let password: String
}
class Login {
    static let shared = Login()
    let baseURL = URL(string: "http://api.cup2022.ir/api/v1/user/login")!
    func fetchFavorites(Email:String,Password:String,completion: @escaping (Result<LoginRes, Error>) -> Void) {
        var request = URLRequest(url: baseURL)
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
        ]
        let encoder = JSONEncoder()
        let user = CreateUserBody(email: Email,password:Password)
        let data = try? encoder.encode(user)
        print(String(data: data!, encoding: .utf8)!)
        request.httpBody = data
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data=data {
                do {
                    let dic = try JSONDecoder().decode(LoginRes.self, from:data)
                   // print(dic)
                    mine.token=dic.data.token
                    completion(.success(dic))
                } catch {
                    do{
                        LoginError = try JSONDecoder().decode(UserError.self, from:data)
                        //print(LoginError)
                        completion(.failure(error))
                        
                    } catch {
                        print(error)
                    }
                }
            }
        }.resume()
    }
}
