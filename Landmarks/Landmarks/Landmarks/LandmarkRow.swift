//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Marimo Shimomura on 2022/12/17.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark // stored property of LandmarkRow
    // LandmarkRow type needs a landmark instance during initialization (preview will stop only with this)->LandmarkRow(landmark: landmarks[0])
    
    var body: some View {
        HStack{ // horizontally
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
  static var landmarks = ModelData().landmarks
  
    static var previews: some View {
        Group{ // return muliple previews
            LandmarkRow(landmark: landmarks[0]) // the first element of the landmarks array
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
