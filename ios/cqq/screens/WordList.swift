import SwiftUI

struct WordList: View {
    @State private var results = [Word]()
    @State private var page = 0
    
    var body: some View {
        VStack {
            List(self.results.enumerated().map({$0}), id: \.element.ID) { i, item in
                NavigationLink(destination: WordDetail(word: item)) {
                    WordColumn(word: item).onAppear {
                        if (i == self.results.endIndex - 1) {
                            self.loadData()
                        }
                    }
                }
            }.onAppear(perform: self.loadData)
        }
        .navigationBarTitle("\(self.results.count)")
    }
    
    func loadData() {
        apiRequest(path: "words/all", body: ["page": page]) { data in
            if let decodedResponse = try? JSONDecoder().decode([Word].self, from: data) {
                if decodedResponse.count > 0 {
                    self.page += 1
                    DispatchQueue.main.sync {
                        self.results += decodedResponse
                    }
                }
                
            }
        }
    }
}

struct WordList_Previews: PreviewProvider {
    static var previews: some View {
        WordList()
    }
}
