//
//  NetworkingManager.swift
//  crypto-app
//
//  Created by HaYen on 20/4/25.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        var errorDescription: String? {
            switch self {
                case .badURLResponse(url: let url):
                    return "Bad response from URL \(url)"
                case .unknown:
                    return "Unknown error occured"
            }
        }
    }
    
    // using static to avoid init class NetworkingManager(), if I want to use func download, i just need NetworkingManager.download
    static func download(url: URL) -> AnyPublisher<Data,Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default)) // subscribe the fetching execution to background thread, so it doesnt block the main thread whichs is reponsible for UI updates
//            .tryMap { (output) -> Data in
//                guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300
//                else { throw URLError(.badServerResponse) } // this sends the error to .sink(receiveCompletion:) failure handler.
//                return output.data
//            }
            .tryMap({ try handleURLResponse(output: $0, url: url) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher() // without using it I must return Publishers.ReceiveOn<Publishers.TryMap<Publishers.SubscribeOn<URLSession.DataTaskPublisher>>,DispatchQueue>, the use of .eraseToAnyPublisher() allows me to return AnyPublisher<Data,Error>. It looks clean, type-erased publisher, easily return a consistent type.
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300
        else { throw NetworkError.badURLResponse(url: url) } // this sends the error to .sink(receiveCompletion:) failure handler.
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
            case .finished:
                break
            case .failure(let error):
                print(error.localizedDescription)
        }
    }
}
