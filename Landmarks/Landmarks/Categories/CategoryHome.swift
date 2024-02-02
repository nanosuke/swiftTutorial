//
//  CategoryHome.swift
//  Landmarks
//
//  Created by 下村蒔里萌 on 2023/05/12.
//

import SwiftUI

struct CategoryHome: View {
  @EnvironmentObject var modelData: ModelData
  
  var body: some View {
    NavigationView { // to host the different categories
      List {
        modelData.features[0].image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                            .listRowInsets(EdgeInsets()) // listの余白を消す
        
        ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
          CategoryRow(categoryName: key, items: modelData.categories[key]!)
        }
        .listRowInsets(EdgeInsets()) // listの余白を消す
      }
      .navigationTitle("Featured")
    }
  }
}

struct CategoryHome_Previews: PreviewProvider {
  static var previews: some View {
    CategoryHome()
      .environmentObject(ModelData())
  }
}
