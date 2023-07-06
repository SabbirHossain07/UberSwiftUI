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
//    let locationManager = LocationManager.shared
    @Binding var mapState: MapViewState
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        switch mapState {
        case .noInput:
            context.coordinator.clearMapViewAndRecenterOnUserLocation()
            break
        case .searchingForLocation:
            break
        case .locationSelected:
            if let coordinate = locationViewModel.selectedUberLocation?.coordinate {
                print("DEBUG: Adding stuf to map..")
                context.coordinator.addAndSelectAnnotation(withCoordinate: coordinate)
                context.coordinator.configurePolyline(withDestinatonCoordinate: coordinate)
            }
            break
        case .polylineAdded:
            break
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
        var userLocationCoordinate: CLLocationCoordinate2D?
        var currentRegion: MKCoordinateRegion?
        
        //MARK: - Lifecyle
        init(parant: UberMapViewRepresentable) {
            self.parant = parant
            super.init()
        }
        
        //MARK: - MKMapViewDelegate
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            self.userLocationCoordinate = userLocation.coordinate
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
            self.currentRegion = region
            parant.mapView.setRegion(region, animated: true)
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let polyline = MKPolylineRenderer(overlay: overlay)
            polyline.strokeColor = .systemBlue
            polyline.lineWidth = 6
            return polyline
        }
        
        //MARK: - Helpers
        func addAndSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D) {
            parant.mapView.removeAnnotations(parant.mapView.annotations)
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            parant.mapView.addAnnotation(anno)
            parant.mapView.selectAnnotation(anno, animated: true)
        }
        
        func configurePolyline(withDestinatonCoordinate coordinate: CLLocationCoordinate2D) {
            guard let userLocationCoordinate = self.userLocationCoordinate else { return }
            parant.locationViewModel.getDestinationRout(from: userLocationCoordinate, to: coordinate) { rout in
                self.parant.mapView.addOverlay(rout.polyline)
                self.parant.mapState = .polylineAdded
                let rect = self.parant.mapView.mapRectThatFits(rout.polyline.boundingMapRect, edgePadding: .init(top: 62, left: 32, bottom: 500, right: 32))
                self.parant.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            }
        }
        
        func clearMapViewAndRecenterOnUserLocation() {
            parant.mapView.removeAnnotations(parant.mapView.annotations)
            parant.mapView.removeOverlays(parant.mapView.overlays)
            
            if let currentRegion = currentRegion {
                parant.mapView.setRegion(currentRegion, animated: true)
            }
        }
    }
}
