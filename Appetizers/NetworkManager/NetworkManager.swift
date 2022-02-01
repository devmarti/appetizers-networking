//
//  NetworkManager.swift
//  Appetizers
//
//  Created by APPS2T on 25/1/22.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    static var baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    // Endpoints
    var appetizerUrl = NetworkManager.baseUrl + "appetizers/"
    
    
    func getAppetizer(completion: @escaping (Request?) -> Void) {
        guard let url = URL(string: appetizerUrl) else {
            completion(nil)
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let networkTask = URLSession.shared.dataTask(with: urlRequest) {
            data, response, error in
            
            guard error == nil else {
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Request.self, from: data)
                completion(response)
            } catch {
                completion(nil)
            }
        }
        
        networkTask.resume()
    }
    

    
    func getImage(appetizerImageUrl: String, completion: @escaping (UIImage?) -> Void){
            guard let url = URL(string: appetizerImageUrl) else {

                completion(nil)

                return

            }

            

            let urlRequest = URLRequest(url: url)

            let networkTask = URLSession.shared.dataTask(with: urlRequest) {

                data, response, error in

                

                guard error == nil else {

                    completion(nil)

                    return

                }

                

                guard let data = data else {

                    completion(nil)

                    return

                }

                let image = UIImage(data: data)

                completion(image)

            }

            

            networkTask.resume()

        }

}
