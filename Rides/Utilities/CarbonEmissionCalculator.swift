//
//  CarbonEmissionCalculator.swift
//  Rides
//
//  Created by Saksha Nagpal on 2024-10-01.
//

import Foundation

class CarbonEmissionCalculator
{
    var kilometerage:Int
    
    init(kilometerage: Int) {
        self.kilometerage = kilometerage
    }
    
    func calculateCarbonEmission(kilometerage:Int) -> [String]
    {
        var carbonEmissionArr:[String] = []
        if kilometerage > 5000
        {
            carbonEmissionArr.append("5000.0")
            let remaining = Double(kilometerage - 5000) * 1.5
            carbonEmissionArr.append(remaining.asNumberString())
        }
        else
        {
            carbonEmissionArr.append(Double(kilometerage).asNumberString())
        }
        
        return carbonEmissionArr
    }
}
