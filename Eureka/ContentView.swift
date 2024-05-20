import SwiftUI

struct ContentView: View {
    @State private var showAllNumbers = false

    var body: some View {
        VStack {
            GeometryReader { geometry in
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: showAllNumbers ? 200 : 100)
                    .overlay(
                        ScrollView {
                            VStack {
                                ForEach(1..<(showAllNumbers ? 11 : 4), id: \.self) { number in
                                    Text("\(number)")
                                        .padding(2)
                                }

                                if !showAllNumbers {
                                    Button(action: {
                                        withAnimation {
                                            showAllNumbers.toggle()
                                        }
                                    }) {
                                        Text("See more")
                                            .padding(5)
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .cornerRadius(5)
                                    }
                                    .padding(.top, 10)
                                }
                            }
                            .padding()
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    )
            }
            .frame(height: showAllNumbers ? 200 : 100) // Fixes the height of the rectangle
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
