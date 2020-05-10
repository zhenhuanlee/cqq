//
//  WordEdit.swift
//  cqq
//
//  Created by jude on 2020/5/10.
//  Copyright © 2020 jude. All rights reserved.
//

import SwiftUI

struct WordForm: View {
    @State var word = initWord()
    
    var body: some View {
        GeometryReader { metrics in
            VStack(alignment: .leading, spacing: 20) {
                myTextfield(label: "English", placeHolder: "EN", value: self.$word.EN)
                myTextfield(label: "Chinese", placeHolder: "CN", value: self.$word.CN)
                Spacer()
                Button(action: self.submit) {
                    Text("SUBMIT")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        
                }
                .frame(width: metrics.size.width * 0.9, height: 60, alignment: .center)
                .background(Color.blue)
                .cornerRadius(10)
                
            }.frame(width: metrics.size.width * 0.9)
        }
    }
    
    func submit() {
        let method = self.word.ID == 0 ? "create" : "update"
        print("----", self.word.dictionary)
        apiRequest(path: "words/\(method)", body: self.word.dictionary) { data in
            print("post result:", data)
        }
    }
}

struct WordForm_Previews: PreviewProvider {
    static var previews: some View {
        WordForm()
    }
}
