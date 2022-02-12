//
//  NetworkService.swift
//  LastDz2session
//
//  Created by Руслан Мотин on 12.02.2022.
//

import Foundation

class NetworkServiceNews {
    func jsonParse() {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
                if let error = error {
                    print(error)
                    return
                }
                guard let data = data else {
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let news = try decoder.decode([News].self, from: data)
                    NewsController.massNews = news
                } catch {
                    print(error)
                }
            }.resume()
         }
    }

