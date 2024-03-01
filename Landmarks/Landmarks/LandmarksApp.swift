import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData() // @Stateでビュー内のプロパティを初期化するのと同じように、model objectを初期化。SwiftUIがViewの状態をビューの存続期間中に1回だけ初期化するのと同様に、アプリの状態もアプリの存続期間中に1回だけ初期化

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
