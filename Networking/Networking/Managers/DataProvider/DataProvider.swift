//
//  DataProvider.swift
//  Lesson 5
//
//  Created by Гнатюк Сергей on 12.04.2021.
//

import UIKit

class DataProvider: NSObject {
    
    // Properties
    private var downloadTask: URLSessionTask!
    public var fileLocation: ((URL) -> ())?
    public var onProgress: ((Double) -> ())?
    
    private lazy var bgSession: URLSession = {
        let config = URLSessionConfiguration.background(withIdentifier: "ru.swiftbook.Networking")
        config.isDiscretionary = true // starting the task at the optimal time
        config.timeoutIntervalForResource = 300 // network timeout
        config.waitsForConnectivity = true //waiting for networking connection
        config.sessionSendsLaunchEvents = true
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()
    
    //MARK: - Public
    
     public func startDownload() {
        if let url = URL(string: "https://speed.hetzner.de/100MB.bin") {
            downloadTask = bgSession.downloadTask(with: url)
            downloadTask.earliestBeginDate = Date().addingTimeInterval(3)
            downloadTask.countOfBytesClientExpectsToSend = 512
            downloadTask.countOfBytesClientExpectsToReceive = 100 * 1024 * 1024
            downloadTask.resume()
        }
    }
    
    public func stopDownload() {
        downloadTask.cancel()
    }
}


