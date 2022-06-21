//
//  File.swift
//  
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Foundation

public protocol NetworkingInterface {
    func createSimpleGetRequest(url: String) -> URLRequest?
    func decodeSimpleObject<T: Codable>(data: Data) -> T?
}

public class Networking: NetworkingInterface {
    
    public init() {
    }
    
    enum Url {
        static let baseUrl = "https://api.tvmaze.com/shows"
    }
    
    private func createValidUrl(url: String) -> URL? {
        guard let urlComponents = URLComponents(string: url) else {
            return nil
        }
                
        guard let urlString = urlComponents.url else {
            return nil
        }
        return urlString
    }
    
    public func createSimpleGetRequest(url: String) -> URLRequest? {
        guard let completeUrl = createValidUrl(url: url) else {
            return nil
        }
        
        return URLRequest(url: completeUrl)
    }
    
    public func decodeSimpleObject<T: Codable>(data: Data) -> T? {
        guard let apiModel = try? JSONDecoder().decode(T.self, from: data) else {
            return nil
        }
        return apiModel
    }
}
