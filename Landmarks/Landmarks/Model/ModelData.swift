import Foundation

@Observable // SwiftUI updates a view only when an observable property changes and the view's body reads the property directly
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json") // Landmark型の配列、landmarkにloadする
    var hikes: [Hike] = load("hikeData.json")
}


func load<T: Decodable>(_ filename: String) -> T { // デコード可能な任意の型を受け入れるジェネリック関数
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) // ファイル名のファイルがあるか確認し、そのファイルのURLを取得
    else {
        fatalError("Couldn't find \(filename) in main bundle.") // エラー処理
    }


    do {
        data = try Data(contentsOf: file) // ファイルの中身を読み込む
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)") // エラー処理
    }


    do {
        let decoder = JSONDecoder() // JSONデコード
        return try decoder.decode(T.self, from: data) // Dataを指定されたジェネリック型Tにデコードする
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)") // エラー処理
    }
}
