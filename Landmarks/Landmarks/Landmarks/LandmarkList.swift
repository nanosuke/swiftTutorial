//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Marimo Shimomura on 2022/12/17.
//

import SwiftUI

struct LandmarkList: View {
  @State private var showFavoritesOnly = false
  @EnvironmentObject var modelData: ModelData // @EnvironmentObjectは一度インスタンス化してしまえば、いちいちインスタンスを渡さずに、全ての画面からアクセスすることができます
  
  var filteredLandmarks: [Landmark] { // Compute a filtered version of the landmarks list by checking the showFavoritesOnly property and each landmark.isFavorite value
    modelData.landmarks.filter { landmark in
      (!showFavoritesOnly || landmark.isFavorite)
    }
  }
  
  var body: some View {
    NavigationView {
      List {
        Toggle(isOn: $showFavoritesOnly){
          Text("Favorites only")
        }
        ForEach(filteredLandmarks) { landmark in
          NavigationLink { // specify the LandmarkDetail view as the destination
            LandmarkDetail(landmark: landmark) // pass the current landmark to the destination Landmark Detail<-LandmarkDetail.swift
          } label: {
            LandmarkRow(landmark: landmark)
            
          }
        }
      }
      .navigationTitle("Landmarks")
    }
  }
  
  /*
   // pass the model data’s landmarks array to the List initializer
   // Lists work with identifiable data. You can make your data identifiable in one of two ways: by passing along with your data a key path to a property that uniquely identifies each element, or by making your data type conform to the Identifiable protocol.
   var body: some View {
   List(landmarks, id:\.id) { landmark in
   LandmarkRow(landmark: landmark) // return a LandmarkRow from the closure
   }
   }
   */
  
}

struct LandmarkList_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkList()
      .environmentObject(ModelData())
    /*
     ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
     LandmarkList()
     .previewDevice(PreviewDevice(rawValue: deviceName))
     .previewDisplayName(deviceName) // to add the device names as labels for the previews
     }
     */
  }
  
}
