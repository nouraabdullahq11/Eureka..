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
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        GeometryReader { geometry in
            VStack {
                if isActive {
                    if UserDefaults.standard.bool(forKey: "isOnboardingCompleted") {
                        HomePage()
                    } else {
                        OnBording()
                    }
                } else {
                    ZStack {
                        Color.gray1
                            .ignoresSafeArea()
                        
                        VStack {
                            Image(colorScheme == .dark ? "Icon1" : "Icon")
                                .resizable()
                                .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.25) // Adjusted dimensions
                            
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
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.25) // Adjusted dimensions
                            .scaledToFit()
                            .scaleEffect(y: 1.2)
                            .position(x: geometry.size.width / 2, y: geometry.size.height * 0.15) // Adjusted position

                        Image("image1")
                            .resizable()
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.15) // Adjusted dimensions
                            .position(x: geometry.size.width / 2, y: geometry.size.height * 0.9) // Adjusted position
                            .padding(.top, geometry.size.height * 0.15)
                    } .ignoresSafeArea(.all)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
