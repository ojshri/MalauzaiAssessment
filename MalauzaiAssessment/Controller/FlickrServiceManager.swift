//
//  FlickrServiceManager.swift
//  MalauzaiAssessment
//
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//

import UIKit

class FlickrServiceManager {
    enum NetworkError: Error {
        case unknownAPIResponse
        case improperUrl
        case generic
    }
    
    /**
     Singleton design pattern.
     Create a static object to access properties & methods
     */
    static let manager = FlickrServiceManager()
    
    //Session object
    private var session: URLSession?
    
    /**
     Private Initializer so that no one can create the object.
     Initialize the default session
     */
    private init() {
        session = URLSession(configuration: .default)
    }
    
    /**
     Method to get the Flickr feed. It places a call to the server with the url and based on the response, it will parse and returns the object or error accordingly
     
     @param url: URL string from where it fetches photos details
     @param completion: Closure that returns the Result - either FlickrFeedResult or Error
     */
    func getFlickrFeed(from url: String,
                       _ completion: @escaping (Swift.Result<FlickrFeedResult, Error>) -> Void) {
        
        guard let flickrURL = URL(string: url) else {
            completion(.failure(NetworkError.improperUrl))
            return
        }
        
        let flickrApiRequest = URLRequest(url: flickrURL)
        
        URLSession.shared.dataTask(with: flickrApiRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let resp = response as? HTTPURLResponse,
                resp.statusCode < 400,
                let receivedData = data else
            {
                completion(.failure(NetworkError.unknownAPIResponse))
                return
            }
                
            do
            {
                let decoder = JSONDecoder()
                let result = try decoder.decode(FlickrFeedResult.self, from: receivedData)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
                return
            }
        }.resume()
    }
}


