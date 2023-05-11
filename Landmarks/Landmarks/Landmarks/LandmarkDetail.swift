//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Marimo Shimomura on 2022/12/17.
//

import SwiftUI

struct LandmarkDetail: View {
  @EnvironmentObject var modelData: ModelData // need access to the environment’s model data ->var landmarkIndex
  var landmark: Landmark // Landmark property to the LandmarkDetail type->LandmarkList.swift
  
  var landmarkIndex: Int{
    modelData.landmarks.firstIndex(where: { $0.id == landmark.id })! // compute the index of the input landmark by comparing it with the model data
  }
  
  var body: some View {
    ScrollView{ // user can scroll through
      MapView(coordinate: landmark.locationCoordinate)
        .ignoresSafeArea(edges: .top) // allow the map content to extend to the top edge of the screen
        .frame(height: 300) // the view automatically sizes
      
      CircleImage(image: landmark.image)
        .offset(y: -130)
        .padding(.bottom, -130)
      
      HStack{
        Text(landmark.name)
          .font(.title)
        FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
      }
      
      VStack(alignment: .leading) { // 横揃え デフォルトでは中央揃え、適したSpacingになっている
        Text(landmark.name)
          .font(.title)
        HStack{
          Text(landmark.park)
          Spacer()
          Text(landmark.state)
        }
        .font(.subheadline)
        .foregroundColor(.secondary)
        
        Divider()
        
        Text("About \(landmark.name)")
          .font(.title2)
        Text(landmark.description)
      }
      .padding()
    }
    .navigationTitle(landmark.name) // to give the navigation bar a title when showing the detail view
    .navigationBarTitleDisplayMode(.inline) // to make the title appear inline
  }
}

struct LandmarkDetail_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkDetail(landmark: ModelData().landmarks[0])
      .environmentObject(ModelData())
  }
}
