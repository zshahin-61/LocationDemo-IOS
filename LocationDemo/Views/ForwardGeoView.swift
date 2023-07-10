//
//  ForwardGeoView.swift
//  LocationDemo
//
//  Created by Zahra Shahin on 2023-07-05.
//

import SwiftUI

struct ForwardGeoView: View {
    @State private var tfStreet : String = ""
    @State private var tfCity : String = ""
    @State private var tfCountry : String = ""
    @State private var result : String = ""
    
    @EnvironmentObject var locationHelper: LocationHelper
    
    var body: some View {
        VStack{
            Text("Forward Geocoding")
                .foregroundColor(.red)
                .fontWeight(.bold)
                .font(.system(size: 30))
                .padding()
            
            Form{
                TextField("Enter Street", text: $tfStreet)
                    .modifier(AppTextFieldModifier())
                
                TextField("Enter City", text: $tfCity)
                    .modifier(AppTextFieldModifier())
                
                TextField("Enter Country", text: $tfCountry)
                    .modifier(AppTextFieldModifier())
            }//Form
            
            Text("\(self.result)")
                .foregroundColor(.red)
                .fontWeight(.bold)
                .font(.system(size: 30))
                .padding()
            
            
            Button(action: {
                let address = "\(self.tfStreet), \(self.tfCity), \(self.tfCountry)"
                self.doGeocoding(address: address)
            }){
                Text("Forward Geocoding")
                    .modifier(AppButtonTextModifier())
            }
            .modifier(AppButtonModifier())
            
            Spacer()
        }//VStack
    }//body
    
    private func doGeocoding(address: String){
        print(#function, "Performing geocoding on address: \(address)")
        
        self.locationHelper.doForwardGeocoding(address: address, completionHandler: {
                (coordinates, error) in
            
            if (error == nil && coordinates != nil){
                
                self.result = "Lat : \(coordinates?.coordinate.latitude) \n Lng : \(coordinates?.coordinate.longitude)"
                
            }else{
                self.result = "Coordinates for given address is not available"
            }
        })
        
    }
}

struct ForwardGeoView_Previews: PreviewProvider {
    static var previews: some View {
        ForwardGeoView()
    }
}
