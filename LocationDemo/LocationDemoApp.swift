//
//  LocationDemoApp.swift
//  LocationDemo
//
//  Created by Zahra Shahin on 2023-07-05.
//

import SwiftUI

@main
struct LocationDemoApp: App {

    let locationHelper = LocationHelper()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(locationHelper)
        }
    }
}
