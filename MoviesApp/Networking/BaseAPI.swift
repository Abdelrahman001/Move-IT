//
//  BaseAPI.swift
//  MoviesApp
//
//  Created by Abdelrahman Hassan on 18/05/2021.
//

import Foundation

class BaseAPI {
    
    @discardableResult class func taskForGetRequest<ResponseType: Codable> (url: URL, response: ResponseType.Type, completionHandler: @escaping (ResponseType?, Error?)->Void) -> URLSessionTask {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let saveData = data else {
                DispatchQueue.main.async {
                    print("Error happened in taskForGeResponse method")
                    completionHandler(nil, error)
                }
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let jsonObj = try decoder.decode(ResponseType.self, from: saveData)
                DispatchQueue.main.async {
                    completionHandler(jsonObj, nil)
                }
            } catch {
                    do {
                        let errorResponse = try decoder.decode(ErrorResponse.self, from: saveData)
                        DispatchQueue.main.async {
                            completionHandler(nil, errorResponse)
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completionHandler(nil, error)
                        }
                    }
                    print("Error decoding json data: \(error)")
            }
        }
        task.resume()
        return task
    }
}
