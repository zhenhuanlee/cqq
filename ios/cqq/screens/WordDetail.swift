//
//  WordItem.swift
//  cqq
//
//  Created by jude on 2020/5/10.
//  Copyright © 2020 jude. All rights reserved.
//

import SwiftUI

struct WordDetail: View {
    let word: Word
    
    var body: some View {
        WordForm(word: word)
    }
}

struct WordItem_Previews: PreviewProvider {
    static var previews: some View {
        WordDetail(word: fakeWord)
    }
}
