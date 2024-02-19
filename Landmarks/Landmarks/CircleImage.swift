import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("stuffedAnimal")
            .resizable()
            .frame(width:200, height:200)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage()
}
