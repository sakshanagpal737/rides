//
//  CarbonEmissionCalculationTests.swift
//  RidesTests
//
//  Created by Saksha Nagpal on 2024-10-02.
//

import XCTest
@testable import Rides

final class CarbonEmissionCalculationTests: XCTestCase {

    private var sut1: VehicleModel!
    private var sut2: VehicleModel!

    override func setUp() {
        super.setUp()
        sut1 = VehicleModel(
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
            kilometrage: 1582,
            licensePlate: "XJF-5555")
        
        sut2 = VehicleModel(
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

    override func tearDown() {
        sut1 = nil
        sut2 = nil
        super.tearDown()
    }
    
    
    func test_kilometerageIsLessThan5000Calculation()
    {
        // Arrange
        let kilometerage = sut1.kilometrage
        let carbonEmissionArr = sut1.carbonEmission
        
        // Act
        // if kilometerage is less than 5000 than carbon emission array should have the same value as kilometerage
        let doubleVal = Double(kilometerage!).asNumberString()
        let arrVal = carbonEmissionArr.first
        
        // Assert
        XCTAssertEqual(doubleVal,arrVal)
    }
    
    func test_kilometerageIsGreatorThan5000Calculation()
    {
        // Arrange
        let kilometerage = sut2.kilometrage
        let carbonEmissionArr = sut2.carbonEmission
        
        // Act
        // if kilometerage is greator than 5000 than carbon emission array should have  2 values : first as 5000 and then remaining * 1.5
        
        let first = "5000.0"
        let second = (Double(kilometerage! - 5000) * 1.5).asNumberString()
        let arrVal1 = carbonEmissionArr.first
        let arrVal2 = carbonEmissionArr.last
        
        // Assert
        XCTAssertEqual(first,arrVal1)
        XCTAssertEqual(second,arrVal2)
    }

}
