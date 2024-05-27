//
//  OnBording.swift
//  Eureka
//
//  Created by Noura Alqahtani on 20/05/2024.
//

import SwiftUI
import Lottie

struct OnbordingSteps {
    let title: String
    let description: String
}

private let onbordingSteps = [
    OnbordingSteps(title: "Welcome to Eureka 👋", description: "Designed specifically for creative thinkers, our platform offers unique techniques and tools to ignite your creativity. Whether you're working on a new project, tackling a problem, or simply looking to boost your creative thinking"),
    OnbordingSteps(title: "Welcome to Eureka 👋", description: "Our app is your ultimate companion for inspiration and brainstorming. Dive in today and unleash your creative potential with us!")
]

struct OnBording: View {
    @State private var currentStep = 0
    @State private var isOnboardingDone = false

    init() {
        UIScrollView.appearance().bounces = false
    }

    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    Image("backgrund")
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                        .position(x: geometry.size.width / 2, y: geometry.size.height * 0.1)

                    LottieView(animation: .named("AnimationOnbording"))
                        .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                        .resizable()
                        .frame(width: geometry.size.width * 0.6)
                        .position(x: geometry.size.width / 2, y: geometry.size.height * 0.15)

                    VStack(spacing: 20) {
                        HStack {
                            Spacer()
                            Button(action: {
                                completeOnboarding()
                            }) {
                                Text("Skip")
                                    .foregroundColor(.black)
                            }
                            .padding(.trailing, 30)
                        }
                        .padding(.top, geometry.size.height * 0.05)

                     //   Spacer()

                        TabView(selection: $currentStep) {
                            ForEach(0..<onbordingSteps.count, id: \.self) { it in
                                VStack {
                                    Text(onbordingSteps[it].title)
                                        .bold()
                                        .padding(.top, geometry.size.height * 0.2)

                                    Text(onbordingSteps[it].description)
                                        .font(.callout)
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.leading)
                                        .padding(.horizontal)
                                        .padding(.top)
                                }
                                .tag(it)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

                        HStack {
                            ForEach(0..<onbordingSteps.count, id: \.self) { it in
                                if it == currentStep {
                                    Rectangle()
                                        .frame(width: 20, height: 10)
                                        .cornerRadius(10)
                                        .foregroundColor(.orange1)
                                } else {
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.gray)
                                }
                            }
                        }

                        NavigationLink(destination: HomePage(), isActive: $isOnboardingDone) {
                            EmptyView()
                        }
                        .hidden()

                        Button(action: {
                            if self.currentStep < onbordingSteps.count - 1 {
                                self.currentStep += 1
                            } else {
                                completeOnboarding()
                            }
                        }) {
                            Text(currentStep < onbordingSteps.count - 1 ? "Next" : "Start Now")
                                .frame(width: geometry.size.width * 0.85, height: 39)
                                .background(Color.laitOrange)
                                .cornerRadius(5)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, geometry.size.height * 0.1)
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .navigationBarHidden(true)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }

    private func completeOnboarding() {
        UserDefaults.standard.set(true, forKey: "isOnboardingCompleted")
        isOnboardingDone = true
    }
}

#Preview {
    OnBording()
}
