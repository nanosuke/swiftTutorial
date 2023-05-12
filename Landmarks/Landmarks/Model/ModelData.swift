//
//  ModelData.swift
//  Landmarks
//
//  Created by Marimo Shimomura on 2022/12/17.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
  @Published var landmarks: [Landmark] = load("landmarkData.json") // array initialize from landmarkData.json
  // @PublishedはObservableObjectプロトコルに準拠したクラス内のプロパティを監視し、変化があった際にViewに対して通知を行う
  var hikes: [Hike] = load("hikeData.json") // データを読み込んだ後変更することはないため、@Publishedをつける必要がない
}


func load<T: Decodable>(_ filename: String) -> T { // load(_:) method fetches JSON data with a given name from the app’s main bundle
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
