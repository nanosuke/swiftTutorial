//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by 下村蒔里萌 on 2023/05/12.
//

import SwiftUI

struct BadgeBackground: View {
  var body: some View {
    GeometryReader { geometry in
      Path { path in
        var width: CGFloat = min(geometry.size.width, geometry.size.height) // assuming a container
        //ジオメトリの2次元のうち最小のものを使用することで、バッジを含むビューが正方形でない場合にバッジの縦横比を維持することができます。
        let height = width
        let xScale: CGFloat = 0.832
        let xOffset = (width * (1.0 - xScale)) / 2.0
        width *= xScale // x軸方向に拡大縮小
        path.move( // The move(to:) method moves the drawing cursor within the bounds of a shape as though an imaginary pen or pencil is hovering over the area, waiting to start drawing
          to: CGPoint(
            x: width * 0.95 + xOffset, // <- xScale
            y: height * (0.20 + HexagonParameters.adjustment)
          )
        )
        
        HexagonParameters.segments.forEach { segment in
          path.addLine(
            to: CGPoint( // The addLine(to:) method takes a single point and draws it. Successive calls to addLine(to:) begin a line at the previous point and continue to the new point
              x: width * segment.line.x + xOffset, // <- xScale
              y: height * segment.line.y
                       )
          )
          
          path.addQuadCurve( // Use the addQuadCurve(to:control:) method to draw the Bézier curves for the badge’s corners
            to: CGPoint(
              x: width * segment.curve.x + xOffset, // <- xScale
              y: height * segment.curve.y
            ),
            control: CGPoint(
              x: width * segment.control.x + xOffset, // <- xScale
              y: height * segment.control.y
            )
          )
        }
      }
      .fill(.linearGradient(
        Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
        startPoint: UnitPoint(x: 0.5, y: 0),
        endPoint: UnitPoint(x: 0.5, y: 0.6)
      ))
    }
    .aspectRatio(1, contentMode: .fit) // オブジェクトの縦横比を設定　幅と高さの比率,fit/fill
  }
  static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
  static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
  static var previews: some View {
    BadgeBackground()
  }
}
