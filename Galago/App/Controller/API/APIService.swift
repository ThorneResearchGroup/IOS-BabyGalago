//
//  APIService.swift
//  Galago
//
//  Created by Inhee Kim on 2022-10-04.
//

import Foundation

final class APIService: ObservableObject {
    
    //static let shared = APIService()
    
    static var main_url = "http://127.0.0.1"//http://alpha.galago.tech" //"http://192.168.1.254"
    
    
    @Published var user = UserEntity(id: -1, permissionGroup: "", username: "", email: "", apiKey: "")
    @Published var isLoggedin = false
    @Published var jsonService: JSONService = JSONService()
    
    private var isDebug: Bool = false // -- ***** DEBUG MODE !!!!! *****
    
    
    
    func Login(username:String, password:String, isSuccessful: @escaping ((Bool) -> Void)) async {
        
        if isDebug { isSuccessful(true) }
        
        let body: [String:AnyHashable] = [
            "username": username,
            "password": password
        ]
        
        //let json = JSONService()
        
        // get response from the post. use the response to convert JSON into struct object.
        // Other objects(class) must be changed into struct.
        // So far, it works.
        await jsonService.Post(body: body, endpoint: APIService.main_url + "/v1/login") { response in
            
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(UserEntity.self, from: response)
                
                if user.apiKey != "" {
                    DispatchQueue.main.async {
                        self.user = user
                    }
                    
                    isSuccessful(true)
                } else {
                    isSuccessful(false)
                }
                
                
            } catch {
                isSuccessful(false)
            }
        }
        
    }
    
    func Logout() {
        
        self.user = UserEntity(id: -1, permissionGroup: "", username: "", email: "", apiKey: "")
        isLoggedin = false
    }
    
    func LoadMedia(entity:String, page:Int = 1, pageSize:Int = 25, type:String = "", startYear:String = "", endYear:String = "",
                   genre: String = "", rating:Int = 0, sortBy:String = "", isSuccessful: @escaping ((Bool) -> Void)) async {
        
        
        //let json = JSONService()
        
        await jsonService.Get(auth: self.user.apiKey, endpoint: APIService.main_url + "/v1/" + entity) { response in
            
            do {
                let decoder = JSONDecoder()
                let movie = try decoder.decode(MovieEntity.self, from: response)
                
                
                if movie.id > 0 {
                    isSuccessful(true)
                } else {
                    isSuccessful(false)
                }
                
                
                
            } catch {
                isSuccessful(false)
            }
            
        }
        
    }
    
    
}
