//
//  VehicleDetailView.swift
//  Rides
//
//  Created by Saksha Nagpal on 2024-09-28.
//

import SwiftUI

struct VehicleDetailView: View {
    
    let vehicle:VehicleModel
    
    var body: some View 
    {
        NavigationStack 
        {
            ZStack
                {
                    //background Layer
                    Color.themeColor.backgroundColor.ignoresSafeArea()
                
                    // content layer
                    VStack
                    {
                        contentCardView
                        Spacer()
                        
                    }
                    
                }
            .navigationTitle(vehicle.makeAndModel ?? "")
        }
    }
}

#Preview {
    VehicleDetailView(vehicle: DeveloperPreview.instance.vehicle)
}


extension VehicleDetailView
{
    private var contentCardView : some View
    {
        ZStack
        {
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundColor(Color.themeColor.backgroundColor)
                .frame(width: UIScreen.main.bounds.size.width - 20, height: 250)
                .shadow(radius: 10)
            
            contentView
            
            
        }
    }
    
    private var contentView : some View
    {
        VStack(alignment: .leading)
        {
            HStack
            {
                Text("Color")
                    .bold()
                Spacer()
                Text(vehicle.color ?? "")
            }
            .padding(.vertical)
            
            HStack
            {
                Text("VIN")
                    .bold()
                Spacer()
                Text(vehicle.vin ?? "")
            }
            .padding(.vertical)
            
            HStack
            {
                Text("Car Type")
                    .bold()
                Spacer()
                Text(vehicle.carType ?? "")
            }
            .padding(.vertical)
            
            
        
        }
        .font(.title3)
        .padding()
       
    }
}
