//
//  ReverseGeoView.swift
//  LocationDemo
//
//  Created by Zahra Shahin on 2023-07-05.
//

import SwiftUI
import CoreLocation

struct ReverseGeoView: View {
    @State private var tfLat : String = ""
    @State private var tfLng : String = ""
    @State private var result : String = ""
    
    @EnvironmentObject var locationHelper: LocationHelper
    
    var body: some View {
        VStack{
            Text("Reverse Geocoding")
                .foregroundColor(.red)
                .fontWeight(.bold)
                .font(.system(size: 30))
                .padding()
            
            Form{
                TextField("Enter Latitude", text: $tfLat)
                    .modifier(AppTextFieldModifier())
                
                TextField("Enter Longitude", text: $tfLng)
                    .modifier(AppTextFieldModifier())
            }//Form
            
            Text("\(self.result)")
                .foregroundColor(.red)
                .fontWeight(.bold)
                .font(.system(size: 30))
                .padding()
            
            
            Button(action: {
                    self.doReverseGeocoding()
            }){
                Text("Reverse Geocoding")
                    .modifier(AppButtonTextModifier())
            }
            .modifier(AppButtonModifier())
            
            Spacer()
        }//VStack
    }//body
    
    private func doReverseGeocoding(){
        print("Performing reversegeocoding ")
        
        guard let lat = Double(self.tfLat) else{
            return
        }
        
        guard let lng = Double(self.tfLng) else{
            return
        }
        
        let inputLocation = CLLocation(latitude: lat, longitude: lng)
        
        self.locationHelper.doReverseGeocoding(location: inputLocation, completionHandler: {(matchingAddress, error) in
            
            if (error == nil && matchingAddress != nil){
                self.result = matchingAddress!
            }else{
                self.result = "Unable to obtain address for given coordinates"
            }
            
        })
        
    }
}

struct ReverseGeoView_Previews: PreviewProvider {
    static var previews: some View {
        ReverseGeoView()
    }
}
