//
//  CategoryHome.swift
//  Landmarks
//
//  Created by 下村蒔里萌 on 2023/05/12.
//

import SwiftUI

struct CategoryHome: View {
  var body: some View {
    NavigationView { // to host the different categories
      Text("Hello, World!")
        .navigationTitle("Featured")
    }
  }
}

struct CategoryHome_Previews: PreviewProvider {
  static var previews: some View {
    CategoryHome()
  }
}
