//
//  StorageService.swift
//  iChat
//
//  Created by Гнатюк Сергей on 29.08.2021.
//

import UIKit
import FirebaseStorage
import FirebaseAuth

final class StorageService {
    
    // MARK: - Properties
    static let shared = StorageService()
    let storageRef = Storage.storage().reference()
    private var avatarRef: StorageReference {
        return storageRef.child(Identifiers.avatarsStorage)
    }
    private var currentUserId: String {
        return Auth.auth().currentUser!.uid
    }
    
    // MARK: - Public
    public func upload(photo: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        guard let scaledImage = photo.scaledToSafeUploadSize, let imageData = scaledImage.jpegData(compressionQuality: 0.4) else { return }
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        avatarRef.child(currentUserId).putData(imageData, metadata: metadata) { metadata, error in
            guard let metadata = metadata else {
                completion(.failure(error!))
                return
            }
            self.avatarRef.child(self.currentUserId).downloadURL { url, error in
                guard let downloadURL = url else {
                    completion(.failure(error!))
                    return
                }
                completion(.success(downloadURL))
            }
        }
    }
}
