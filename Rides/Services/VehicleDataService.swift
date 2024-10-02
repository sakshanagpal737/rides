//
//  VehicleDataService.swift
//  Rides
//
//  Created by Saksha Nagpal on 2024-09-27.
//

import Foundation



class VehicleDataService 
{
    enum NetworkError : LocalizedError
    {
        case badURLResponse(url:URL)
        case unknown
        case invalidURL
        
        var errorDescription: String?
        {
            switch self
            {
            case .badURLResponse(url : let url): return "Bad response from URL :\(url)"
            case .unknown : return "Unknown error occured"
            case .invalidURL : return "Invalid URL"
            }
        }
    }
   
    var vehicleArr:[VehicleModel]? = nil
    
   // var inputSize:String?
    
//    init(size:String)
//    {
//        self.inputSize = size
//        getVehicle(size:size)
//    }
    
    
    
    
    
     func fetchVehicleWithAsyncURLSession(size:String) async throws -> [VehicleModel] {

        guard let url = URL(string: "https://random-data-api.com/api/vehicle/random_vehicle?size=\(size)") else {
            throw NetworkError.invalidURL
        }

        // Use the async variant of URLSession to fetch data
        // Code might suspend here
        let (data, _) = try await URLSession.shared.data(from: url)

        // Parse the JSON data
        let result = try JSONDecoder().decode([VehicleModel].self, from: data)
        return result
    }
   
}

