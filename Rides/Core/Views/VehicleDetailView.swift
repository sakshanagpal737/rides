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
                        Spacer()
                        contentCardView
                        Spacer()
                        carbonEmissionCards
                    }
                    
                }
            .navigationTitle(vehicle.makeAndModel ?? "")
            .onAppear(perform: {
                
            })
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
                Text(vehicle.vin)
            }
            .padding(.vertical)
            
            HStack
            {
                Text("Car Type")
                    .bold()
                Spacer()
                Text(vehicle.carType)
            }
            .padding(.vertical)
            
            
        
        }
        .font(.title3)
        .padding()
       
    }
    
    private var carbonEmissionCards : some View
    {
        VStack
        {
            ScrollView(.horizontal)
            {
                HStack(spacing:0)
                {
                    ForEach(0..<20) { index in
                        Rectangle()
                            .frame(width: 300, height: 400)
                            .cornerRadius(10)
                            .overlay {
                                Text("\(index)")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                            }
                            .id(index)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding(10)
                            
                    }
                }
                
            }
            .ignoresSafeArea()
           
        }
    }
}
