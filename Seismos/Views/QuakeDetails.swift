//
//  QuakeDetails.swift
//  Seismos
//
//  Created by Aanuoluwa Otitoola on 20/05/2020.
//  Copyright © 2020 Aanuoluwa Otitoola. All rights reserved.
//


import SwiftUI
import Foundation
import UIKit
import MapKit


struct QuakeDetails: View {
    
    var data: Features
    var body: some View {
        ZStack(alignment: .top) {
            MapView(data: data)
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .center, spacing: 6) {
                Text(String(data.properties.mag))
                    .font(.largeTitle)
                
               Text(data.properties.place)
            }.clipShape(Rectangle())
                .frame(width: nil, height: nil)
                .padding(.all, 20)
                .background(Color.green)
            .shadow(radius: 9)
            .cornerRadius(9)
                .opacity(0.8)
        }
    }
}

struct MapView: UIViewRepresentable {
    var data: Features
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let annotation = MKPointAnnotation()
        let coordinate = CLLocationCoordinate2D(latitude: data.geometry.coordinates[1], longitude: data.geometry.coordinates[0])
        let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        annotation.coordinate = coordinate
        annotation.title = data.properties.place
        annotation.subtitle = "Magintude: \(data.properties.mag)"
        
        uiView.setRegion(region, animated: true)
        uiView.addAnnotation(annotation)
    }
}
