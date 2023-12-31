//
//  APIService.swift
//  SwiftUI-MVVM
//
//  Created by Yusuke Kita on 6/6/19.
//  Copyright © 2019 Yusuke Kita. All rights reserved.
//

import Foundation
import Combine

protocol APIRequestType {
    associatedtype Response: Decodable
    
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}

protocol APIServiceType {
    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType
}

final class APIService: APIServiceType {
    
    private let baseURL: URL
    init(baseURL: URL = URL(string: "https://api.themoviedb.org/3/")!) {
        self.baseURL = baseURL
    }

    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType {
    
        let pathURL = URL(string: request.path, relativeTo: baseURL)!
        
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = request.queryItems
        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNGY3OGFjY2RiZTQwNWNhOGNhYjA0OTY4ZDRlNjMwNiIsInN1YiI6IjU5Yjk4Yzk5YzNhMzY4MTM1MDAxYmE2OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.z9GsE8WDjAOLQf20fY6F1jw1YfexlCCELCV-Z8nLJao", forHTTPHeaderField: "Authorization")
        let decorder = JSONDecoder()
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { data, urlResponse in data }
            .mapError { _ in APIServiceError.responseError }
            .decode(type: Request.Response.self, decoder: decorder)
            .mapError(APIServiceError.parseError)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
