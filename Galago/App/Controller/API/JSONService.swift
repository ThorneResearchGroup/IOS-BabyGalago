//
//  JSONService.swift
//  Galago
//
//  Created by Inhee Kim on 2022-10-04.
//

import Foundation

final class JSONService {
    

    func Post(body:[String: AnyHashable], endpoint:String, response: @escaping ((Data) -> Void)) async {
        
        
        // try converting endpoint to URL. if endpoint is not in right format, return false.
        guard let url = URL(string: endpoint) else {
            return
        }
        
        var request:URLRequest = URLRequest(url: url)

        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Application/json", forHTTPHeaderField: "Accept")
        
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        //, options: .fragmentsAllowed)
        //request.httpBody = Data("{ \"username\": \"123\", \"password\":\"1234567890\"}".utf8)
        
        URLSession.shared.dataTask(with: request) { data, res, error in

            guard let data = data, error == nil else {
                return
            }
            //guard (res as? HTTPURLResponse)?.statusCode == 200 else { return }
            //print(data.base64EncodedString())
            response(data)

        }
        .resume()
    }

    func Get(auth: String, endpoint:String, response: @escaping ((Data) -> Void)) async {
        // try converting endpoint to URL. if endpoint is not in right format, return false.
        guard let url = URL(string: endpoint) else {
            return
        }
        
        var request:URLRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        if (auth != "") {
            request.setValue(auth, forHTTPHeaderField: "Authorization")
        }
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            response(data)
            
        }
        
        dataTask.resume()
        
    }
    
}
