//
//  CategoryItem.swift
//  Landmarks
//
//  Created by 下村蒔里萌 on 2023/05/13.
//

import SwiftUI

struct CategoryItem: View {
  var landmark: Landmark
  
  var body: some View {
    VStack(alignment: .leading) {
      landmark.image
        .renderingMode(.original) // button内の画像の色を青に変えない
        .resizable()
        .frame(width: 155, height: 155)
        .cornerRadius(5)
      Text(landmark.name)
        .font(.caption)
        .foregroundColor(.primary)
    }
    .padding(.leading, 15)
  }
}

struct CategoryItem_Previews: PreviewProvider {
  static var previews: some View {
    CategoryItem(landmark: ModelData().landmarks[0])
  }
}
