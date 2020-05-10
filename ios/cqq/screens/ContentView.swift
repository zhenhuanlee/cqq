import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 30) {
                nvButton(label: "LIST", dest: WordList())
                nvButton(label: "NEW", dest: WordForm())
                Spacer()
            }
        }
    }
}

struct nvButton<Dest>: View where Dest: View {
    var label: String
    var dest: Dest
    
    var body: some View {
        NavigationLink(destination: self.dest) {
            Text(self.label)
        }
        .foregroundColor(.white)
        .frame(width: 300, height: 60, alignment: .center)
        .background(Color.blue)
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
