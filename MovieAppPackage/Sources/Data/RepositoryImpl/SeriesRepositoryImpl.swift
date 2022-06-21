//
//  File.swift
//  
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Foundation
import Domain

public class SeriesRepositoryImpl: SeriesRepository {

    let networking: NetworkingInterface
    let session: URLSession
    
    public init(networking: NetworkingInterface, session: URLSession) {
        self.networking = networking
        self.session = session
    }
    
    public func getShows(page: Int, completion: @escaping (Result<[Show], Error>) -> Void) {
        guard let request = networking.createSimpleGetRequest(url: Networking.Url.baseUrl) else {
            return
        }
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            guard let data = data,
                  let apiModel: [ShowResponse] = self.networking.decodeSimpleObject(data: data) else {
                      guard let error = error else {
                          return
                      }
                      return completion(.failure(error))
            }
            
            let finalResult = ModelMapper.map(input: apiModel)
            return completion(.success(finalResult))
        })
        task.resume()
    }
    
    
}
