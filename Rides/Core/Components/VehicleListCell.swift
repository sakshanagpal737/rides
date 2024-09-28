//
//  VehicleListCell.swift
//  Rides
//
//  Created by Saksha Nagpal on 2024-09-27.
//

import SwiftUI

struct VehicleListCell: View {
    
    let vehicle:VehicleModel
    
    var body: some View {
        HStack
        {
            VStack(alignment: .leading)
            {
                Text(vehicle.makeAndModel ?? "")
                    .font(.title)
                    .bold()
                Text(vehicle.vin ?? "")
                    .font(.title2)
            }
            
            Spacer()
            
            
        }
    }
}

#Preview {
    VehicleListCell(vehicle:DeveloperPreview.instance.vehicle)
}
