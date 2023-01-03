import Foundation
struct Welcome: Codable {
    let status: String
    let data: [Datum]
}

struct Datum: Codable {
    let id: String
    let awayScore: Int
    let awayScorers: [String]
    let awayTeamID, finished, group: String
    let homeScore: Int
    let homeScorers: [String]
    let homeTeamID, datumID, localDate, matchday: String
    let persianDate, stadiumID, timeElapsed, type: String
    let homeTeamFa, awayTeamFa, homeTeamEn, awayTeamEn: String
    let homeFlag, awayFlag: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case awayScore = "away_score"
        case awayScorers = "away_scorers"
        case awayTeamID = "away_team_id"
        case finished, group
        case homeScore = "home_score"
        case homeScorers = "home_scorers"
        case homeTeamID = "home_team_id"
        case datumID = "id"
        case localDate = "local_date"
        case matchday
        case persianDate = "persian_date"
        case stadiumID = "stadium_id"
        case timeElapsed = "time_elapsed"
        case type
        case homeTeamFa = "home_team_fa"
        case awayTeamFa = "away_team_fa"
        case homeTeamEn = "home_team_en"
        case awayTeamEn = "away_team_en"
        case homeFlag = "home_flag"
        case awayFlag = "away_flag"
    }
}
struct Body: Encodable {
    let date: String
}
class Match : ObservableObject {
    @Published var data: [Datum]=[]
    static let shared = Match()
    func getAll(completion: @escaping (Result<Welcome, Error>) -> Void) {
        let baseURL = URL(string: "http://api.cup2022.ir/api/v1/match")!
        var request = URLRequest(url: baseURL)
        request.allHTTPHeaderFields = [
            "Authorization": "Bearer \(mine.token)",
            "Content-Type": "application/json",
        ]
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data=data {
                do {
                    let dic = try JSONDecoder().decode(Welcome.self, from:data)
                    print(dic)
                    DispatchQueue.main.async {
                        self.data = dic.data
                    }
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    func fetchDate(bydate:String,completion: @escaping (Result<Welcome, Error>) -> Void) {
        let baseURL = URL(string: "http://api.cup2022.ir/api/v1/bydate")!
        var request = URLRequest(url: baseURL)
        request.allHTTPHeaderFields = [
            "Authorization": "Bearer \(mine.token)",
            "Content-Type": "application/json",
        ]
        let encoder = JSONEncoder()
        let user = Body(date:bydate)
        let data = try? encoder.encode(user)
        print(String(data: data!, encoding: .utf8)!)
        request.httpBody = data
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data=data {
                do {
                    let dic = try JSONDecoder().decode(Welcome.self, from:data)
                    print(dic)
                    DispatchQueue.main.async {
                        self.data = dic.data
                    }
                } catch {
                    completion(.failure(error))
                }
            }
            
        }.resume()
        }
    }

