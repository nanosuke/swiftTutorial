/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view displaying information about a hike, including an elevation graph.
 */

import SwiftUI


extension AnyTransition { // Extract the transition as a static property of AnyTransition
  static var moveAndFade: AnyTransition {
    /*AnyTransition.move(edge: .trailing) // graph slides in and out from the same side: .top、.leading、.bottom、.trailing*/
    
    .asymmetric( // provide different transitions for when the view appears and disappears
     insertion: .move(edge: .trailing).combined(with: .opacity),
     removal: .scale.combined(with: .opacity)
    )
  }
}

struct HikeView: View {
  var hike: Hike
  @State private var showDetail = true
  
  var body: some View {
    VStack {
      HStack {
        HikeGraph(hike: hike, path: \.elevation)
          .frame(width: 50, height: 30)
        
        VStack(alignment: .leading) {
          Text(hike.name)
            .font(.headline)
          Text(hike.distanceText)
        }
        
        Spacer()
        
        Button {
          withAnimation {
            showDetail.toggle()
          }
        } label: {
          Label("Graph", systemImage: "chevron.right.circle")
            .labelStyle(.iconOnly)
            .imageScale(.large)
            .rotationEffect(.degrees(showDetail ? 90 : 0))
            .scaleEffect(showDetail ? 1.5 : 1) // size animation
            .padding()
        }
      }
      
      if showDetail {
        HikeDetail(hike: hike)
          .transition(.slide)
      }
    }
  }
}

struct HikeView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      HikeView(hike: ModelData().hikes[0])
        .padding()
      Spacer()
    }
  }
}
