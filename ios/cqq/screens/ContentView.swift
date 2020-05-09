//
//  ContentView.swift
//  LearnEnglish
//
//  Created by jude on 2020/3/17.
//  Copyright © 2020 jude. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var results = [Word]()
    
    var body: some View {
        GeometryReader { metrics in
            NavigationView {
                VStack {
                    List(self.results, id: \.ID) { item in
                        NavigationLink(destination: WordDetail(word: item)) {
                            VStack (alignment: .leading) {
                                HStack {
                                    Text(item.EN)
                                        .frame(width: metrics.size.width * 0.8, alignment: .leading)
                                    Text(item.CN)
                                }
                                
                            }
                        }
                    }.onAppear(perform: self.loadData)
                }
                .navigationBarTitle("\(self.results.count)")
            }
        }
    }
    
    func loadData() {
        apiGet(path: "words") { data in
            if let decodedResponse = try? JSONDecoder().decode([Word].self, from: data) {
                DispatchQueue.main.sync {
                    self.results = decodedResponse
                    print(self.results[0])
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
