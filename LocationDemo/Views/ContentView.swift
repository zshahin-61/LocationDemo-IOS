//
//  ContentView.swift
//  LocationDemo
//
//  Created by Zahra Shahin on 2023-07-05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            
            ForwardGeoView().tabItem{
                Image(systemName: "mappin.and.ellipse")
                Text("Forward Geo")
            }
            
            ReverseGeoView().tabItem{
                Image(systemName: "location.circle.fill")
                Text("Reverse Geo")
            }
            
            MapView().tabItem{
                Image(systemName: "map.fill")
                Text("Map")
            }
        }//TabView
        
        .navigationBarTitle("LocationDemo")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
