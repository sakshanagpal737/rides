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
    
    let vehicleVM = VehicleViewModel()
    
    let vehicle = VehicleModel(
        id: 2525,
        uid: "a13b1b24-d9c8-4ca5-b8dd-9da210aa22aa",
        vin: "44773KBP9P3145529",
        makeAndModel: "Honda Accord",
        color: "Blue",
        transmission: "Automatic",
        driveType: "RWD",
        fuelType: "Gasoline Hybrid",
        carType: "Regular Cab Pickup",
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
