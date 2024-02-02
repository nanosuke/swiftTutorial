//
//  ContentView.swift
//  Landmarks
//
//  Created by Marimo Shimomura on 2022/12/16.
//

import SwiftUI

struct ContentView: View {
  @State private var selection: Tab = .featured
  
  enum Tab { // 列列挙
    case featured
    case list
  }
  
  var body: some View {
    TabView(selection: $selection) {
      CategoryHome()
        .tabItem { // 下のナビゲーションバー
          Label("Featured", systemImage: "star")
        }
        .tag(Tab.featured)
      
      LandmarkList()
        .tabItem {
          Label("List", systemImage: "list.bullet")
        }
        .tag(Tab.list)
    }
  }
} // describes the view's content and layout


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(ModelData()) // makes the object available to any subview
    // A preview fails if any subview requires a model object in the environment
  }  // declares a preview for that view
}
