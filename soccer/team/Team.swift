import Foundation

struct TeamRes: Codable {
    let status: String
    let data: [Teams]
}

struct Teams: Codable {
    let id, group: String
    let teams: [TeamData]

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case group, teams
    }
}

struct TeamData: Codable {
    let teamID, mp, w, l: String
    let pts, gf, ga, gd: String
    let d, nameFa, nameEn: String
    let flag: String
    var isSave: Bool? 

    enum CodingKeys: String, CodingKey {
        case teamID = "team_id"
        case mp, w, l, pts, gf, ga, gd, d
        case nameFa = "name_fa"
        case nameEn = "name_en"
        case flag
    }
}
class Team : ObservableObject {
    @Published var data: [Teams]=[]
    static let shared = Team()
    func fetchall(completion: @escaping (Result<TeamRes, Error>) -> Void) {
        let baseURL = URL(string: "http://api.cup2022.ir/api/v1/standings")!
        var request = URLRequest(url: baseURL,cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30)
        request.allHTTPHeaderFields = [
            "Authorization": "Bearer \(mine.token)",
            "Content-Type": "application/json",
        ]
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data=data {
                do {
                    let res = try JSONDecoder().decode(TeamRes.self, from:data)//https://zh.wikipedia.org/zh-tw/2022%E5%B9%B4%E5%9C%8B%E9%9A%9B%E8%B6%B3%E5%8D%94%E4%B8%96%E7%95%8C%E7%9B%83%E5%8F%83%E8%B3%BD%E7%90%83%E5%93%A1%E5%90%8D%E5%96%AE
                    DispatchQueue.main.async {
                        self.data = res.data
                    }
                    completion(.success(res))
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            }
            else if let error = error {
                print(error)
                completion(.failure(error))
            }
            
        }.resume()
        }
    }

