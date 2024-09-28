//
//  VehicleViewModel.swift
//  Rides
//
//  Created by Saksha Nagpal on 2024-09-27.
//

import Foundation
import Combine

class VehicleViewModel : ObservableObject
{
    @Published var vehicleArr:[VehicleModel] = []
    
    @Published var inputText:String = ""
    
   // private let vehicleDataService = VehicleDataService(size: "")
    private var cancelables = Set<AnyCancellable>()
    
    init()
    {
        addSubscribers()
       // vehicleDataService.inputSize = inputText
    }
    
    func fetchVehicles()
    {
        let vehicleDataService = VehicleDataService(size: inputText)
        
        vehicleArr = vehicleDataService.vehicleArr ?? []
    }
    
    
    
    func addSubscribers()
    {
        let vehicleDataService = VehicleDataService(size: inputText)
        
        vehicleDataService.$vehicleArr
            .debounce(for: .seconds(2.0), scheduler: DispatchQueue.main)
            .sink { [weak self] returnedVehicle in
                self?.vehicleArr = returnedVehicle ?? []
            }
            .store(in: &cancelables)
        
        
//        $inputText
//            .combineLatest(vehicleDataService.$vehicleArr)
//            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
//            .map(filterVehicle)
//            .sink { returnedVehicle in
//                self.vehicleArr = returnedVehicle
//            }
//            .store(in: &cancelables)
    }
    
    
    private func filterVehicle(text:String,vehicle:[VehicleModel]) -> [VehicleModel]
    {
        guard !text.isEmpty else
        {
            return vehicleArr
        }
       
        
        let sortArr = vehicleArr.sorted { v1, v2 in
            v1.vin ?? "" > v2.vin ?? ""
        }
        
        return sortArr
       
    }
    
    

    
}

