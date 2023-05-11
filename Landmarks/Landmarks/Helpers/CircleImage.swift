//
//  CircleImage.swift
//  Landmarks
//
//  Created by Marimo Shimomura on 2022/12/16.
//

import SwiftUI

struct CircleImage: View {
    var image: Image // stored image property
    
    var body: some View {
        image
            .clipShape(Circle()) // 円でマスク
            .overlay{
                Circle().stroke(.white, lineWidth:4) // 枠線
            }
            .shadow(radius: 7) // add drop-shadowvariable
            // Command click and show SwiftUI Inspector
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
