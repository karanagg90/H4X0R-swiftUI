//
//  NetworkManager.swift
//  H4X0R-swiftUI
//
//  Created by Karan Aggarwal on 04/01/21.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func observe(){
        
    }
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                        
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        }catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
