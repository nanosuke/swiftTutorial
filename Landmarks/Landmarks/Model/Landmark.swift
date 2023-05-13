//
//  Landmark.swift
//  Landmarks
//
//  Created by Marimo Shimomura on 2022/12/17.
//

import Foundation
import SwiftUI
import CoreLocation // locationCoordinate property: useful for interacting with the MapKit framework

struct Landmark: Hashable, Codable, Identifiable { // Identifiable->able to use collections of Landmark elements directly
  // The Landmark data already has the id property required by Identifiable protocol; you only need to add a property to decode it when reading the data
  var id: Int
  var name: String
  var park: String
  var state: String
  var description: String
  var isFavorite: Bool
  var isFeatured: Bool
  
  var category: Category
  enum Category: String, CaseIterable, Codable {
    case lakes = "Lakes"
    case rivers = "Rivers"
    case mountains = "Mountains"
  }
  
  private var imageName: String // to read the name of the image from the data, and a computed image property that loads an image from the asset catalog
  // make the property private because users of the Landmarks structure care only about the image itself
  var image: Image{
    Image(imageName)
  }
  
  private var coordinates: Coordinates // add a coordinates property to the structure using a nested Coordinates type that reflects the storage in the JSON data structure
  // mark this property as private because you’ll use it only to create a public computed property in the next step
  var locationCoordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(
      latitude: coordinates.latitude,
      longitude: coordinates.longitude)
  }
  
  struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
  }
}
