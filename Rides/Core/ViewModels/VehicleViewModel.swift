//
//  VehicleViewModel.swift
//  Rides
//
//  Created by Saksha Nagpal on 2024-09-27.
//

import Foundation


class VehicleViewModel : ObservableObject
{
    @Published var vehicleArr:[VehicleModel] = []
    
    @Published var inputText:String = ""
    @Published var isLoading: Bool = false
    @Published var sortOption: SortOption = .vin
    @Published var showAlert:Bool = false
   
    
   // private let vehicleDataService = VehicleDataService(size: "")

    enum SortOption {
        case vin, carType
    }
    
    init(inputText:String)
    {
        self.inputText = inputText
        fetchVehicles(size: inputText)
    }
    
    private func getVehicles(size:String)
    {
        Task {
            do {
                let serviceRequest:VehicleDataService = VehicleDataService()
                let vehicles = try await serviceRequest.fetchVehicleWithAsyncURLSession(size: size)
                isLoading = false
                self.vehicleArr = vehicles
                
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    
    
    func fetchVehicles(size:String)
    {
        if validateInputStringIsInRange(size: size)
        {
            isLoading = true
            DispatchQueue.main.async {
                self.getVehicles(size: size)
            }
            showAlert = false
        }
        else
        {
            showAlert = true
        }
    }
    
    func validateInputStringIsInRange(size:String) -> Bool
    {
        let num = Int(size) ?? 0
        
        if num > 0 && num <= 100
        {
            return true
        }
        else
        {
            return false
        }
        
    }
    
    
    func reloadData() {
        isLoading = true
        fetchVehicles(size: inputText)
    
    }
    
    private func sortVehicles(sort: SortOption, vehicles: inout [VehicleModel]) {
        switch sort {
        case .vin:
            vehicles.sort(by: { $0.vin < $1.vin })
        case .carType:
            vehicles.sort(by: { $0.carType < $1.carType })
       
        }
    }
    
    func calculateCarbonEmission(kilometerage:Int) -> [Double]
    {
        var carbonEmissionArr:[Double] = []
        if kilometerage > 5000
        {
            carbonEmissionArr.append(5000)
            let remaining = Double(kilometerage - 5000) * 1.5
            carbonEmissionArr.append(remaining)
        }
        else
        {
            carbonEmissionArr.append(Double(kilometerage))
        }
        
        return carbonEmissionArr
    }
    

    
}

