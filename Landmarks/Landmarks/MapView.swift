import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }

    private var region: MKCoordinateRegion{
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 34.68743856037725,
                longitude: 135.52586595592916),
            span:  MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
}

#Preview {
    MapView()
}
