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
        apiRequest(path: "words/all", body: ["page": page], type: [Word].self) { decodedResponse in
            let data = decodedResponse as! [Word]
            if data.count > 0 {
                self.page += 1
                DispatchQueue.main.sync {
                    self.results += data
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
