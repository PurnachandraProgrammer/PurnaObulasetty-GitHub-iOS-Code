//
//  CityListApiService.swift
//  CheqJSONKeepApp
//
//  Created by Purnachandra on 09/09/24.
//

import Foundation

class CityListApiService : CityApiResourceService {

    func getCitisList() async  -> (CityData?,Error?) {
        return await self.getTask(with: ApiResource.cityResource)
    }
    
    private func getTask<T: Codable>(with url: URL) async -> (T?,Error?) {
        
        let urlRequest = URLRequest(url: url)
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30.0 // 30 seconds
        config.timeoutIntervalForResource = 60.0 // 60 seconds

        let urlSession = URLSession(configuration: config)
        
        do {
            let (data,_) = try await urlSession.data(for: urlRequest)
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(T.self, from: data)
            return (result,nil)
        }

        catch {
            print("the error is \(error)")
            return (nil,error)
        }
        
        
    }

}
