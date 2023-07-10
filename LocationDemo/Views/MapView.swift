//
//  MapView.swift
//  LocationDemo
//
//  Created by Zahra Shahin on 2023-07-05.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var locationHelper : LocationHelper
    
//    @State private var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.64253, longitude: -79.38201), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.64253, longitude: -79.38201), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var body: some View {
        VStack{
//            Map(coordinateRegion: self.$coordinateRegion, interactionModes: .all, showsUserLocation: true)
            
            //check for specific permission and enable/disable features
            
            if (self.locationHelper.currentLocation != nil){
//                Map(coordinateRegion: self.$region, interactionModes: .all)
                
                MyMap(location: self.locationHelper.currentLocation!)
                
            }else{
                Text("Obtaining user location ....")
            }
        }
        .onAppear(){
            //check/request for permissions
            self.locationHelper.checkPermission()
            
//            if (self.locationHelper.currentLocation != nil){
//
//                self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.locationHelper.currentLocation!.coordinate.latitude, longitude: self.locationHelper.currentLocation!.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
//            }
        }
    }//body
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}


struct MyMap : UIViewRepresentable{
    
    typealias UIViewType = MKMapView
    
    private var location : CLLocation
    @EnvironmentObject var locationHelper : LocationHelper
    let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    
    init(location : CLLocation){
        self.location = location
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        let sourceCoordinates : CLLocationCoordinate2D
        let region : MKCoordinateRegion
        
        if (self.locationHelper.currentLocation != nil){
            sourceCoordinates = self.locationHelper.currentLocation!.coordinate
        }else{
            sourceCoordinates = CLLocationCoordinate2D(latitude: 43.64732, longitude: -79.38279)
        }
        
        region = MKCoordinateRegion(center: sourceCoordinates, span: span)
        
        let map = MKMapView(frame: .infinite)
        map.mapType = MKMapType.standard
        map.isZoomEnabled = true
        map.isUserInteractionEnabled = true
        map.showsUserLocation = true
        
        map.setRegion(region, animated: true)
        
        return map
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        let sourceCoordinates : CLLocationCoordinate2D
        let region : MKCoordinateRegion
        
        if (self.locationHelper.currentLocation != nil){
            sourceCoordinates = self.locationHelper.currentLocation!.coordinate
        }else{
            sourceCoordinates = CLLocationCoordinate2D(latitude: 43.64732, longitude: -79.38279)
        }
        
        region = MKCoordinateRegion(center: sourceCoordinates, span: span)
        
        let mapAnnotation = MKPointAnnotation()
        mapAnnotation.coordinate = sourceCoordinates
        mapAnnotation.title = "You're here !"
        
        uiView.setRegion(region, animated: true)
        uiView.addAnnotation(mapAnnotation)
        
    }
    
}
