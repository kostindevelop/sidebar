//
//  Networker.swift
//  sidebar
//
//  Created by Konstantin Igorevich on 24.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import Foundation

class Networker {
    static let shared = Networker()
    
    func loadUser(_ completion: @escaping (UserModel?, Error?) -> Void) {
        let urlString = General.Url.base
        guard let url = URL(string: urlString) else {
            completion(nil, nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, error)
                return
            }
            let userModel = try? JSONDecoder().decode(UserModel.self, from: data)
            DispatchQueue.main.async {
                completion(userModel, nil)
            }
        }
        task.resume()
    }
}
