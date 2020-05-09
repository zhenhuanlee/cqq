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
        guard let url = URL(string: "http://119.3.25.247:1111/1000") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Word].self, from: data) {
                    DispatchQueue.main.sync {
                        self.results = decodedResponse
                        print(self.results[0])
                    }
                }
                
                return
            }
        }.resume()
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
