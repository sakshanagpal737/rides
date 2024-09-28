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
        
        var errorDescription: String?
        {
            switch self
            {
            case .badURLResponse(url : let url): return "Bad response from URL :\(url)"
            case .unknown : return "Unknown error occured"
            }
        }
    }
   
    @Published var vehicleArr:[VehicleModel]? = nil
    
    var inputSize:String?
    
    init(size:String)
    {
        self.inputSize = size
        getVehicle(size:size)
    }
    
    private func getVehicle(size:String)
    {
        let apiUrlStr = "https://random-data-api.com/api/vehicle/random_vehicle?size=\(size)"
        
        if let apiUrl = URL(string: apiUrlStr) {
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: apiUrl) { (data, response, error) in
                
                // Handle the response
                
                // Check for errors
                if let err = error {
                    print(NetworkError.badURLResponse(url: apiUrl))
                    return
                }
                
                // Check if data is available
                guard let responseData = data else {
                    print(NetworkError.unknown)
                    return
                }
                
                // Process the received data
                do
                {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([VehicleModel].self, from: responseData)
                    
                    //print(result)
                    
                    self.vehicleArr = result
                }
                catch
                {
                    print("Error parsing JSON: \(error)")
                }
            }
            
            dataTask.resume()
        } else {
            print(NetworkError.badURLResponse(url: URL(string: apiUrlStr)!))
        }
    }
   
}

