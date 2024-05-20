//
//  Step1.swift
//  Eureka
//
//  Created by NorahAlmukhlifi on 12/11/1445 AH.
//

import SwiftUI

struct Step1: View {
    @Binding var navigateToSession: Bool
    
    var body: some View {
        ZStack{
            Image("backgrund")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Text("Step1")
                    .font(.title3)
                    .foregroundColor(.white)
                Text("Crazy 8")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                navigateToSession = true
            }
        }
    }
}

struct Step2: View {
    @Binding var navigateToSession: Bool
    
    var body: some View {
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
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                navigateToSession = true
            }
        }
    }
}

struct Step3: View {
    var likedWords: [String]
    var items: [DataItem]
    var sessionName: String
    var sessionType: String
    var userInputs: [String]
    var displayedQuestion: String
    var selectedWord: String
    
    @State private var timerSeconds = 0
    @State private var navigateToSessionCrazy8 = false
    
    var body: some View {
        ZStack{
            Image("backgrund")
                .resizable()
                .ignoresSafeArea()
        VStack {
            Text("Step 3")
                .font(.title)
                .padding()
            
            // You can add any content specific to your Step 3 view here
        }
        .onAppear {
            // Start a timer to automatically navigate after 2 seconds
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                if timerSeconds < 2 {
                    timerSeconds += 1
                } else {
                    // After 2 seconds, navigate to session_crazy8 view
                    timer.invalidate()
                    navigateToSessionCrazy8 = true
                }
            }
        }
        .background(
            NavigationLink(
                destination: session_Crazy8(
                    likedWords: likedWords,
                    items: items,
                    sessionName: sessionName,
                    sessionType: sessionType,
                    userInputs: userInputs,
                    displayedQuestion: displayedQuestion,
                    selectedWord: selectedWord
                ),
                isActive: $navigateToSessionCrazy8
            ) {
                EmptyView()
            }
                .hidden()
        )
    }
}
}


struct Step4: View {
    var likedWords: [String]
    var items: [DataItem]
    var sessionName: String
    var sessionType: String
    var userInputs: [String]
    var displayedQuestion: String
    var selectedWord: String
    
    @State private var timerSeconds = 0
    @State private var navigateToSessionReverseBrainstorming = false
    
    var body: some View {
        ZStack{
            Image("backgrund")
                .resizable()
                .ignoresSafeArea()
        VStack {
            Text("Step 4")
                .font(.title)
                .padding()
            
            // Add any additional content for Step 4 here
        }
        .onAppear {
            // Start a timer to automatically navigate after 2 seconds
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                if timerSeconds < 2 {
                    timerSeconds += 1
                } else {
                    // After 2 seconds, navigate to Session_ReverseBrainstorming view
                    timer.invalidate()
                    navigateToSessionReverseBrainstorming = true
                }
            }
        }
        .background(
            NavigationLink(
                destination: Session_ReverseBrainstorming(
                    items: items,
                    sessionName: sessionName,
                    sessionType: sessionType,
                    userInputs: userInputs,
                    displayedQuestion: displayedQuestion,
                    selectedWord: selectedWord,
                    likedWords: likedWords
                ),
                isActive: $navigateToSessionReverseBrainstorming
            ) {
                EmptyView()
            }
                .hidden()
        )
    }
}
}
