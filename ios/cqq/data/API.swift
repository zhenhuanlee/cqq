import SwiftUI

private let host = "http://119.3.25.247:1111"
//private let host = "http://localhost:1111"

func apiRequest<T>(path: String, body: [String: Any], type: T.Type, block: @escaping (Decodable) -> Void) where T: Decodable {
    guard let url = URL(string: "\(host)/\(path)") else {
        print("Invalid URL")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = try! JSONSerialization.data(withJSONObject: body)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let decodedResponse = try? JSONDecoder().decode(type, from: data) {
                block(decodedResponse)
            }
            return
        }
    }.resume()
}
