//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Marimo Shimomura on 2022/12/16.
//

import SwiftUI

@main
struct LandmarksApp: App {
  @StateObject private var modelData = ModelData() // @StateObject attribute to initialize a model object for a given property only once during the life time of the app
  
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(modelData)
        }
    }
}
