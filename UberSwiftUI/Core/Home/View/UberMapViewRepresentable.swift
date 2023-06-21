//
//  UberMapViewRepresentable.swift
//  UberSwiftUI
//
//  Created by Sopnil Sohan on 20/6/23.
//

import Foundation
import SwiftUI
import MapKit

struct UberMapViewRepresentable: UIViewRepresentable {
    
    let mapView = MKMapView()
    let locationManager = LocationManager()
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let coordinate = locationViewModel.selectedLocationCoordinate {
            context.coordinator.addAndSelectAnnotation(withCoordinate: coordinate)
        }
    }
    
    func makeCoordinator() -> Mapcoordinator {
        return Mapcoordinator(parant: self)
    }
}

extension UberMapViewRepresentable {
    class Mapcoordinator: NSObject, MKMapViewDelegate {
        //MARK: - Properties
        let parant: UberMapViewRepresentable
        
        //MARK: - Lifecyle
        init(parant: UberMapViewRepresentable) {
            self.parant = parant
            super.init()
        }
        
        //MARK: - MKMapViewDelegate
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            parant.mapView.setRegion(region, animated: true)
        }
        
        //MARK: - Helpers
        func addAndSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D) {
            parant.mapView.removeAnnotations(parant.mapView.annotations)
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            parant.mapView.addAnnotation(anno)
            parant.mapView.selectAnnotation(anno, animated: true)
            
            parant.mapView.showAnnotations(parant.mapView.annotations, animated: true)
        }
    }
}
