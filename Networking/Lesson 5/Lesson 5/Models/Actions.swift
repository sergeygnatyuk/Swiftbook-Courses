//
//  Actions.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 01.05.2021.
//

import Foundation

enum Actions: String, CaseIterable {
    case downloadImage = "Download Image"
    case get = "GET"
    case post = "POST"
    case ourCourses = "Our Courses"
    case uploadImage = "Upload Image"
    case downloadFile = "Download File"
    case ourCoursesAlamofire = "Our Courses (Alamofire)"
    case responseData = "responseData"
    case responseString = "responseString"
    case response = "response"
    case downloadLargeImage = "Download Large Image"
    case postAlamofire = "POST with Alamofire"
    case putRequest = "PUT Request with Alamofire"
    case uploadImageAlamofire = "Upload Image (Alamofire)"
}
