//
//  VehicleListView.swift
//  Rides
//
//  Created by Saksha Nagpal on 2024-09-27.
//

import SwiftUI

struct VehicleListView: View {
    
    @State var sizeText:String = ""
    @State var showActionSheet = false
    @EnvironmentObject private var vehicleVM:VehicleViewModel
    @State var showList:Bool = false
    @State var showAlert:Bool
    
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
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            self.showActionSheet.toggle()
                        } label: {
                            Image(systemName: "arrow.up.arrow.down")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)

                        }
                        .confirmationDialog("", isPresented: $showActionSheet) {
                                    showSortOption
                                }
                        
                    }
                   
                })
                .navigationTitle("Vehicle List")
            
        }
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
    
    func getAlert() -> Alert{
        
         Alert(title: Text("Please enter a size between 1 to 100"),
               message: Text(""),
               primaryButton: .destructive(Text("Okay"), action: {
             
                
         }),
            secondaryButton: .cancel())
 }
    
  
}

#Preview {
    NavigationView{
        VehicleListView(showAlert: true)
            .environmentObject(VehicleViewModel(inputText: "1"))
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
                UIApplication.shared.endEditing()
                vehicleVM.fetchVehicles(size: sizeText)
                if vehicleVM.showAlert
                {
                    showAlert = true
                }
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
    
    
    private var  showSortOption : some View
    {
        VStack
        {
            Button("Sort By VIN") {
                vehicleVM.sortOption = .vin
                vehicleVM.reloadData()
            }
            Button("Sort By Car Type")
            {
                vehicleVM.sortOption = .carType
                vehicleVM.reloadData()
            }
        }
       
        
    }
}



