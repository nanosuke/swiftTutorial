import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    // modelDataプロパティを使用して、ModelData型の環境変数にアクセスできるように。Environment属性で環境変数ModelDataへアクセス、ModelData.selfでModelData型への型参照
    @State private var showFavoritesOnly = false // private to hold information that's specific to a view and its subviews
    // @Stateはバインディングの仕組みの一つ、値が更新可能になり、値の変更がSwiftUIによってモニタリングされる

    var filteredLandmarks: [Landmark] { // check the showFavoritesOnly property and each landmark.isFavorite value and filter
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) { // use $ prefis to access a binding to a state variable, or one of its properties
                    Text("Favorites Only")
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
