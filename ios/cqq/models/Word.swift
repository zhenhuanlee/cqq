//
//  Word.swift
//  LearnEnglish
//
//  Created by jude on 2020/4/25.
//  Copyright © 2020 jude. All rights reserved.
//

import SwiftUI

struct Word: Decodable {
    var ID: NSInteger
    var EN: String
    var CN: String
}

let fakeWord = Word(ID: 1, EN: "hello", CN: "你好")
