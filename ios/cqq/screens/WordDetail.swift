//
//  WordDetail.swift
//  LearnEnglish
//
//  Created by jude on 2020/4/25.
//  Copyright © 2020 jude. All rights reserved.
//

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
