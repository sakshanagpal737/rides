//
//  VehicleListView.swift
//  Rides
//
//  Created by Saksha Nagpal on 2024-09-27.
//

import SwiftUI

struct VehicleListView: View {
    
    @State var sizeText:String = ""
    @EnvironmentObject private var vehicleVM:VehicleViewModel
    @State var showList:Bool = false
    
    var body: some View {
    NavigationStack
        {
            ZStack
                {
                    //background Layer
                    Color.themeColor.backgroundColor.ignoresSafeArea()
                
                    // content layer
                    VStack
                    {
                       addVehicleHeader
                        
                       Spacer()
                        
                        if !sizeText.isEmpty
                        {
                            vehicleList
                        }
                        
                    }
                }
                .navigationTitle("Vehicle List")
            
        }
    }
}

#Preview {
    NavigationView{
        VehicleListView()
            .environmentObject(VehicleViewModel())
    }
}


extension VehicleListView
{
    private var addVehicleHeader: some View
    {
        HStack
        {
            TextField("Enter Size", text: $sizeText,onEditingChanged: { textChange in
                showList = false
            })
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(Color.themeColor.accentColor,
                        lineWidth: 1)
                    )
            .padding()
            .keyboardType(.numberPad)
        
            
           
          
            Button(action: {
                showList = true
                UIApplication.shared.endEditing()
                vehicleVM.inputText = sizeText
                vehicleVM.addSubscribers()
            }, label: {
                Text("Show")
                    .padding()
                    .background(Color.themeColor.buttonBackgroundColor)
                    .foregroundColor(Color.themeColor.primaryColor)
                    .cornerRadius(5.0)
            })
            
        }
        .padding()
    }
    
    private var vehicleList: some View
    {
        List
        {
            ForEach(vehicleVM.vehicleArr) { vehicle in
                                
                NavigationLink {
                    VehicleDetailView(vehicle: vehicle)
                } label: {
                    VehicleListCell(vehicle: vehicle)
                }

                
            }
        }
        
        .listStyle(.plain)
    }
}



