//
//  APIService.swift
//  ADVA Task
//
//  Created by mohamed dorgham on 02/10/2022.
//

import Foundation
import Combine

class APIService {
    static let shared = APIService()
    
    func getPosts(perPage: Int = 10, page: Int = 1) -> AnyPublisher<PostsResponse, Error> {
     
        var components = URLComponents(string: "https://dummyapi.io/data/v1/post")!
        
        components.queryItems = [
            URLQueryItem(name: "limimt", value: "\(perPage)"),
            URLQueryItem(name: "page", value: "\(page)")
        ]
        
        
        var request = URLRequest(url: components.url!, timeoutInterval: 10)
        
        request.addValue("6338d32f4a749b92803c4b67", forHTTPHeaderField: "app-id")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: PostsResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
