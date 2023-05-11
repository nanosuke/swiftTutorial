//
//  MapView.swift
//  Landmarks
//
//  Created by Marimo Shimomura on 2022/12/16.
//

import SwiftUI
import MapKit // gain access to SwiftUI-specific functionality provided by that framework

struct MapView: View {
    var coordinate: CLLocationCoordinate2D // 座標 to pass a fixed coordinate
    @State private var region = MKCoordinateRegion()
        // private state that holds he region for the map
        // @State attribute is to establish a source of truth for data in your app that you can modify from more than one view. SwiftUI manages the underlying storage and automatically updates views that depend on the value
    
    var body: some View{
        Map(coordinateRegion: $region) // by putting $ before state variable, you pass a binding, which is like a reference to a underlying value. When the user interacts with the map, the map updates the region value to match the part of the map that's currently visible
            .onAppear { // triggers a calculation based on the current coordinate
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D){ // update the region based on  coordinate value
        region = MKCoordinateRegion(
            center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
