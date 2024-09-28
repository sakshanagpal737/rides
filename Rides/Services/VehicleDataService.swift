//
//  VehicleDataService.swift
//  Rides
//
//  Created by Saksha Nagpal on 2024-09-27.
//

import Foundation
import Combine

class VehicleDataService
{
   
    @Published var vehicleArr:[VehicleModel]? = nil
    //var cancelables:Set<AnyCancellable>
    
    var vehicleSubscription: AnyCancellable?
    var inputSize:String?
    
    init(size:String)
    {
        self.inputSize = size
        getVehicle(size:size)
    }
    
    private func getVehicle(size:String)
    {
        // Define the URL you want to request
        let apiUrlStr = "https://random-data-api.com/api/vehicle/random_vehicle?size=\(size)"
        
        // Create a URL object from the string
        if let apiUrl = URL(string: apiUrlStr) {
            
            // Create a URLSession instance
            let session = URLSession.shared
            
            // Create a data task using URLSessionDataTask
            let dataTask = session.dataTask(with: apiUrl) { (data, response, error) in
                
                // Handle the response
                
                // Check for errors
                if let error = error {
                    print("Error: \\(error)")
                    return
                }
                
                // Check if data is available
                guard let responseData = data else {
                    print("No data received")
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
                    print("Error parsing JSON: \\(error)")
                }
            }
            
            dataTask.resume()
        } else {
            print("URL is not valid!")
        }
    }
    
   /* private func getVehicle(size:String)
    {
        guard let url = URL(string:"https://random-data-api.com/api/vehicle/random_vehicle?size=\(size)")  else
        {
            return
        }
        
        
        vehicleSubscription = NetworkManager.download(url: url)
            .decode(type: [VehicleModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion,
                  receiveValue: { [weak self] returnedVehicles in
                self?.vehicleArr = returnedVehicles
                self?.vehicleSubscription?.cancel()
            })
            
           // print(vehicleArr ?? [])
    }*/
}

