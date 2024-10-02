//
//  UIApplication.swift
//  Rides
//
//  Created by Saksha Nagpal on 2024-09-28.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
