import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData()) // サブビューが環境内のmodel objectを必要としているのにも関わらず、プレビューしているビューにenvironment修飾子がないとき、プレビューは失敗する
}
