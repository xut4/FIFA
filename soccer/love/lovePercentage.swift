import Foundation
struct per: Codable {
    let fname: String
    let sname: String
    let percentage: String
}
class lovePercentage {
    static let shared = lovePercentage()
    
    func fetchFavorites(sname:String,fname:String,completion: @escaping (Result<per, Error>) -> Void) {
        let baseURL = URL(string: "https://love-calculator.p.rapidapi.com/getPercentage?sname=\(sname)&fname=\(fname)")!
        var request = URLRequest(url: baseURL)
        request.allHTTPHeaderFields = [
            "X-RapidAPI-Key": "1a96dbe6e6mshd5b4fd88dbf7aebp11341bjsn2cec9f0d133c",
            "X-RapidAPI-Host":"love-calculator.p.rapidapi.com"
        ]
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let favorites = try decoder.decode(per.self, from: data)
                    completion(.success(favorites))
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }.resume()
    }
}
