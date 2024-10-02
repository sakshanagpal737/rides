//
//  InputTextValidator.swift
//  Rides
//
//  Created by Saksha Nagpal on 2024-10-01.
//

import Foundation

class InputTextValidator
{
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
}
