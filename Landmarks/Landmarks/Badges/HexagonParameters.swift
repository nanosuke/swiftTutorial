//
//  HexagonParameters.swift
//  Landmarks
//
//  Created by 下村蒔里萌 on 2023/05/12.
//

import Foundation
import CoreGraphics // can use CGpoint

struct HexagonParameters {
  struct Segment {
    let line: CGPoint
    let curve: CGPoint
    let control: CGPoint
  } // 各辺は前の辺が終わったところから始まり、最初の点まで直線で移動し、角のベジエ曲線上を移動して2番目の点まで移動します。3点目は曲線の形状をコントロールする
  
  static let adjustment: CGFloat = 0.085
  
  static let segments = [ // six segments, one for each side of the hexagon
    Segment(
      line:    CGPoint(x: 0.60, y: 0.05),
      curve:   CGPoint(x: 0.40, y: 0.05),
      control: CGPoint(x: 0.50, y: 0.00)
    ),
    Segment(
      line:    CGPoint(x: 0.05, y: 0.20 + adjustment),
      curve:   CGPoint(x: 0.00, y: 0.30 + adjustment),
      control: CGPoint(x: 0.00, y: 0.25 + adjustment)
    ),
    Segment(
      line:    CGPoint(x: 0.00, y: 0.70 - adjustment),
      curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),
      control: CGPoint(x: 0.00, y: 0.75 - adjustment)
    ),
    Segment(
      line:    CGPoint(x: 0.40, y: 0.95),
      curve:   CGPoint(x: 0.60, y: 0.95),
      control: CGPoint(x: 0.50, y: 1.00)
    ),
    Segment(
      line:    CGPoint(x: 0.95, y: 0.80 - adjustment),
      curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),
      control: CGPoint(x: 1.00, y: 0.75 - adjustment)
    ),
    Segment(
      line:    CGPoint(x: 1.00, y: 0.30 + adjustment),
      curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),
      control: CGPoint(x: 1.00, y: 0.25 + adjustment)
    )
  ]
}

