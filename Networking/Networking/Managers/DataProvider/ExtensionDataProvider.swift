//
//  ExtensionDataProvider.swift
//  Networking
//
//  Created by Гнатюк Сергей on 03.05.2021.
//

import UIKit 

extension DataProvider: URLSessionDelegate {
    
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        DispatchQueue.main.async {
            guard
                let appDelegate = UIApplication.shared.delegate as? AppDelegate,
                let completionHandler = appDelegate.bgSessionCompletionHandler
            else { return }
            appDelegate.bgSessionCompletionHandler = nil
            completionHandler()
        }
    }
}

extension DataProvider: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Did finish downloading: \(location.absoluteString)")
        DispatchQueue.main.async {
            self.fileLocation?(location)
        }
    }
    
    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64,
                    totalBytesWritten: Int64,
                    totalBytesExpectedToWrite: Int64) {
        
        guard totalBytesExpectedToWrite != NSURLSessionTransferSizeUnknown else { return }
        
        let progress = Double(Double(totalBytesWritten)/Double(totalBytesExpectedToWrite))
        print("Download progress: \(progress)")
        
        DispatchQueue.main.async {
            self.onProgress?(progress)
        }
    }
}

extension DataProvider: URLSessionTaskDelegate {
    //restoring the connection
    func urlSession(_ session: URLSession, taskIsWaitingForConnectivity: URLSessionTask) {
    }
}
