//
//  ContentView.swift
//  Landmarks
//
//  Created by Marimo Shimomura on 2022/12/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
} // describes the view's content and layout


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(ModelData()) // makes the object available to any subview
        // A preview fails if any subview requires a model object in the environment
    }  // declares a preview for that view
}
