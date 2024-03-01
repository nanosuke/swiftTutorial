import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable { // Hashable：値に基づいてハッシュ値を計算できるため Codable：型をエンコードしたりデコードしたりできるため Identifiable：一意性を識別するための仕組み
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool

    private var imageName: String // read the name of the image
    var image: Image{ // loads an image from the asset
        Image(imageName)
    }

    private var coordinates: Coordinates // the storage in the JSON data
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude:coordinates.longitude
        )
    }

    struct Coordinates: Hashable, Codable{ // Hashable:その型の値を元にハッシュ値が計算可能である　Codable:任意のデータ型に変換できる
        var latitude: Double
        var longitude: Double
    }
}
