import SwiftUI

struct WordColumn: View {
    var word: Word
    
    var body: some View {
        GeometryReader { metrics in
            VStack (alignment: .leading) {
                HStack {
                    Text(self.word.EN)
                        .frame(width: metrics.size.width, alignment: .leading)
                }
            }
        }
    }
}

struct WordDetail_Previews: PreviewProvider {
    static var previews: some View {
        WordColumn(word: fakeWord)
    }
}
