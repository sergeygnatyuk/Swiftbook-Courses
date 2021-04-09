//
//  ViewController.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 09.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func getRequest(_ sender: Any) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let response = response,
                  let data = data else
            { return }
            print(response)
            print(data)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
    
    @IBAction func postRequest(_ sender: Any) {
    }
    
    
}

