//
//  SplashScreen.swift
//  Eureka
//
//  Created by Noura Alqahtani on 20/05/2024.
//


import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    var body: some View {
        VStack {
            if isActive {
                if UserDefaults.standard.bool(forKey: "isOnboardingCompleted") {
                    HomePage()
                } else {
                    OnBording()
                }
            } else {
                ZStack {
                    VStack {
                        Image("Icon")
                            .resizable()
                            .frame(width: 119, height: 180)

                        Text("Eureka")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.orange1)
                            .padding(.top, 50)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 2)) {
                            self.size = 2
                            self.opacity = 0.9
                        }
                    }

                    Image("image2")
                        .resizable()
                        .frame(width: 393, height: 200)
                        .scaledToFit()
                        .scaleEffect(y: 1.2)
                        .padding(.bottom, 710)

                    Image("image1")
                        .resizable()
                        .frame(width: 393, height: 100)
                        .padding(.top, 740)

                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.isActive = true
            }
        }
    }
}

#Preview {
    SplashScreen()
}
