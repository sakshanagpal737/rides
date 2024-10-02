//
//  Preview.swift
//  Rides
//
//  Created by Saksha Nagpal on 2024-09-27.
//

import Foundation
import SwiftUI

extension PreviewProvider
{
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview
{
    static let instance = DeveloperPreview()
    
    private init()
    {
        
    }
    
    let vehicleVM = VehicleViewModel(inputText: "1")
    
    let vehicle = VehicleModel(
        id: 2525,
        vin: "a13b1b24-d9c8-4ca5-b8dd-9da210aa22aa",
        carType: "44773KBP9P3145529",
        uid: "Honda Accord",
        makeAndModel: "Honda Accord",
        color: "Blue",
        transmission: "RWD",
        driveType: "Gasoline Hybrid",
        fuelType: "Regular Cab Pickup",
        carOptions: ["Airbag: Passenger",
                     "DVD System",
                     "Fog Lights",
                     "Antilock Brakes",
                     "Tow Package"],
        specs: [ "Tilt steering column",
                 "Universal garage door opener",
                 "Pwr accessory delay",
                 "Tire pressure monitoring system (TPMS)",
                 "6.1L SRT V8 \"Hemi\" engine"],
        doors: 3,
        mileage: 57462,
        kilometrage: 15822,
        licensePlate: "XJF-5555")
    
    
   
}
