import SwiftUI

struct WordDetail: View {
    var word: Word
    
    var body: some View {
        Text(word.EN)
            .font(.largeTitle)
    }
}

struct WordDetail_Previews: PreviewProvider {
    static var previews: some View {
        WordDetail(word: fakeWord)
    }
}
