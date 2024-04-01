//
//  TVShowService.swift
//  Movie App
//
//  Created by Bilal Ahmad on 31/03/2024.
//

import Foundation

class TVShowService {
    static let shared = TVShowService()


    func fetchTVShow(id: Int, completion: @escaping (Result<TVShowModel, Error>) -> Void) {
        let urlString = "\(App.BASE_URL.TV_SHOW)/\(id)?api_key=\(App.API_KEY)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let tvShow = try decoder.decode(TVShowModel.self, from: data)
                completion(.success(tvShow))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
}
