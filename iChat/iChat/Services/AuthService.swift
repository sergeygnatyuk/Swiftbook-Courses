//
//  AuthService.swift
//  iChat
//
//  Created by Гнатюк Сергей on 29.07.2021.
//

import UIKit
import Firebase
import FirebaseAuth

final class AuthService {
    
    //MARK: - Properties
    private let auth = Auth.auth()
    static let shared = AuthService()
    
    // MARK: - Public
    public func register(email: String?, password: String?, confirmPassword: String, completion: @escaping (Result<User, Error>) -> Void) {
        auth.createUser(withEmail: email!, password: password!) { result, error in
            guard let result = result else { completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
    
    public func login(email: String?, password: String?, completion: @escaping (Result<User, Error>) -> Void) {
        auth.signIn(withEmail: email! , password: password!) { result, error in
            guard let result = result else { completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
}
