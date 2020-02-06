//
//  TopStoriesAPIClient.swift
//  NYCTopStories
//
//  Created by Margiett Gil on 2/6/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation
import NetworkHelper

struct NYTopStoriesAPIClient
{
    static func fetchTopStories(for section: String, completion: @escaping (Result<[Article], AppError>) -> ()) {
        let endPointURLString = ""
        guard let url = URL(string: endPointURLString) else {
            completion(.failure(.badURL(endPointURLString)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let AppError):
                completion(.failure(.networkClientError(AppError)))
            case .success(let data):
                do{
                    let topStories = try JSONDecoder().decode(TopStories.self, from: data)
                    completion(.success(topStories.results))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}


