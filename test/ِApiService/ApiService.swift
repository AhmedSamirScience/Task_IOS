//
//  ApiService.swift
//  test
//
//  Created by ahmed samir on 06/01/2024.
//

import Foundation

 

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case invalidData
    case decodingError(Error)
}

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func fetchData<T: Codable>(from urlString: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }

        let session = URLSession.shared

        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(.requestFailed(error)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }

            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        // Decode the received data into your Codable model
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedData))
                    } catch let decodingError {
                        completion(.failure(.decodingError(decodingError)))
                    }
                } else {
                    completion(.failure(.invalidData))
                }
            } else {
                completion(.failure(.invalidResponse))
            }
        }

        task.resume()
    }
}





