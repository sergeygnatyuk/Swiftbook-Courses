//
//  StorageManager.swift
//  Lesson 2 MyPlaces
//
//  Created by Гнатюк Сергей on 17.03.2021.
//

import RealmSwift


let realm = try! Realm()

class StorageManager {
    
    
    
    static func saveObject(_ place: Place) {
        try! realm.write {
            realm.add(place)
        }
    }
    
    static func deletObject(_ place: Place){
        
        try! realm.write {
            realm.delete(place)
        }
        
    }
    
}
