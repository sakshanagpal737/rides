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
    @Published var showAlert:Bool = false
   // @Published var carbonEmissionArr:[String] = []
    
    var inputTextValidator:InputTextValidator = InputTextValidator()
   
    
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
                DispatchQueue.main.async { [self] in
                    self.vehicleArr = vehicles
                    self.reloadData(sortOption: .vin)
                    self.isLoading = false
                    
                }
                
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    
    
    func fetchVehicles(size:String)
    {
        if inputTextValidator.validateInputStringIsInRange(size: size)
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
    

    func reloadData(sortOption:SortOption) {
        isLoading = true
        self.vehicleArr = sortVehicles(sort:sortOption , vehicles: self.vehicleArr)
    
    }
    
    private func sortVehicles(sort: SortOption, vehicles:[VehicleModel]) -> [VehicleModel]
    {
        var tempArr:[VehicleModel] = []
        
        switch sort {
        case .vin:
            tempArr = vehicles.sorted(by: { $0.vin < $1.vin})
        case .carType:
            tempArr = vehicles.sorted(by: { $0.carType < $1.carType })
        }
        
        self.isLoading = false
        
        return tempArr
    }
    
   
 
    

    
}

