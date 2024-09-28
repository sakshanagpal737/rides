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
       // vehicleDataService.inputSize = inputText
    }
    
    func fetchVehicles(size:String)
    {
        if validateInputStringIsInRange(size: size)
        {
            let vehicleDataService = VehicleDataService(size: size)
            vehicleArr = vehicleDataService.vehicleArr ?? []
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
    
    
    

    
}

