//
//  WordEdit.swift
//  cqq
//
//  Created by jude on 2020/5/10.
//  Copyright © 2020 jude. All rights reserved.
//

import SwiftUI

struct WordForm: View {
    @State var message = ""
    @State var word = initWord()
    @State var showAlert = false
    
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
                        .frame(width: metrics.size.width * 0.9, height: 60, alignment: .center)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .alert(isPresented: self.$showAlert) {
                    Alert(title: Text(self.message))
                }
                
            }.frame(width: metrics.size.width * 0.9)
        }
    }
    
    func submit() {
        let method = self.word.ID == 0 ? "create" : "update"
        apiRequest(path: "words/\(method)", body: self.word.dictionary, type: Resp.self) { decoded in
            let resp = decoded as! Resp
            print(resp.code)
            if resp.code == 0 {
                self.message = "saved successfully"
            } else {
                self.message = "saved failed"
            }
            self.showAlert = true
        }
    }
}

struct WordForm_Previews: PreviewProvider {
    static var previews: some View {
        WordForm()
    }
}
