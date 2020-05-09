//
//  test.swift
//  LearnEnglish
//
//  Created by jude on 2020/3/17.
//  Copyright © 2020 jude. All rights reserved.
//

import SwiftUI

struct test: View {

    var body: some View {
        VStack {
        Text("123")
            A(){
                "qw4"
            }
        }
    }
}

struct A: View {
    var content: String
    
    init(content: ()->String) {
        self.content = content()
    }
    
    var body: Text {
        Text(self.content)
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
