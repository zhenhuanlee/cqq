import SwiftUI

struct Word: Decodable {
    var ID: NSInteger
    var EN: String
    var CN: String
    
    var dictionary: [String: Any] {
        return [
            "ID": ID,
            "EN": EN,
            "CN": CN
        ]
    }
}

func initWord() -> Word {
    return Word(ID: 0, EN: "", CN: "")
}

let fakeWord = Word(ID: 1, EN: "hello", CN: "你好")
