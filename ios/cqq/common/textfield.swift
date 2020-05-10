//
//  textfield.swift
//  cqq
//
//  Created by jude on 2020/5/10.
//  Copyright © 2020 jude. All rights reserved.
//

import SwiftUI

struct myTextfield: View {
    var label: String
    var placeHolder: String
    @State var value: Binding<String>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(label)
            TextField(placeHolder, text: value)
                .font(.custom("AmericanTypewriter", size: 30))
                .cornerRadius(30)
        }
    }
}

/*
struct textfield_Previews: PreviewProvider {
    @State var name = "hello"
    
    static var previews: some View {
        myTextfield(label: "ENGLISH", placeHolder: "EN", value: self.$name)
    }
}
*/
