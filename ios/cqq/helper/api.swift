//
//  api.swift
//  LearnEnglish
//
//  Created by jude on 2020/5/9.
//  Copyright © 2020 jude. All rights reserved.
//

import SwiftUI

let host = "http://119.3.25.247:1111"

func apiGet(path: String, block: @escaping (Data) -> Void) {
    guard let url = URL(string: "\(host)/\(path)") else {
        print("Invalid URL")
        return
    }
    let request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            block(data)
            return
        }
    }.resume()
}
