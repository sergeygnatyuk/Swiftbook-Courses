//
//  AlamofireNetworkRequest.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 13.04.2021.
//

import Foundation
import Alamofire

class AlamofireNetworkRequest {
    
    static func sendRequest(url: String, completion: @escaping (_ courses: [Course])->()) {
        
        guard let url = URL(string: url) else { return }
        
        request(url, method: .get).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                
                var courses = [Course]()
                courses = Course.getArray(from: value)!
    
                completion(courses)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}



