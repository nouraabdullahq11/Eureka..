//
//  Step1.swift
//  Eureka
//
//  Created by NorahAlmukhlifi on 12/11/1445 AH.
//

import SwiftUI

struct Step1: View {
    var body: some View {
        ZStack{
            Image("backgrund")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Text("Step1")
                    .font(.title3)
                    .foregroundColor(.white)
                Text("Random Words")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
    }
}


struct Step2: View{
    var body: some View{
        ZStack{
            Image("backgrund")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Text("Step2")
                    .font(.title3)
                    .foregroundColor(.white)
                Text("Reverse Brainstorming")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    Step2()
}
#Preview {
    Step1()
}
