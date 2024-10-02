//
//  Double.swift
//  Rides
//
//  Created by Saksha Nagpal on 2024-10-01.
//

import Foundation

extension Double
{
    /// Converts a Double into string representation
    /// ```
    /// Convert 1.2345 to "1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
}
