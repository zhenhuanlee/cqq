import SwiftUI

struct Word: Decodable {
    var ID: NSInteger
    var EN: String
    var CN: String
}

let fakeWord = Word(ID: 1, EN: "hello", CN: "你好")
