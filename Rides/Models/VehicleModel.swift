//
//  VehicleModel.swift
//  Rides
//
//  Created by Saksha Nagpal on 2024-09-27.
//

import Foundation

struct VehicleModel: Codable, Identifiable
{
    let id: Int?
    let vin,carType:String
    let uid, makeAndModel, color: String?
    let transmission, driveType, fuelType: String?
    let carOptions, specs: [String]?
    let doors, mileage, kilometrage: Int?
    let licensePlate: String?

       enum CodingKeys: String, CodingKey {
           case id, uid, vin
           case makeAndModel = "make_and_model"
           case color, transmission
           case driveType = "drive_type"
           case fuelType = "fuel_type"
           case carType = "car_type"
           case carOptions = "car_options"
           case specs, doors, mileage, kilometrage
           case licensePlate = "license_plate"
       }
}
