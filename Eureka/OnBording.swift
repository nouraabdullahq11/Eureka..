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
        NavigationView {
            ZStack {
                Image("backgrund")
                    .resizable()
                    .frame(width: 395, height: 411)
                    .padding(.bottom, 500)

                LottieView(animation: .named("AnimationOnbording"))
                    .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                    .resizable()
                    .frame(width: 240)
                    .padding(.bottom, 500)

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
                    .padding(.top, 90)

                    Spacer()

                    TabView(selection: $currentStep) {
                        ForEach(0..<onbordingSteps.count, id: \.self) { it in
                            VStack {
                                Text(onbordingSteps[it].title)
                                    .bold()
                                    .padding(.top, 250)

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
                            .frame(width: 337, height: 39)
                            .background(Color.laitOrange)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 130)
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private func completeOnboarding() {
        UserDefaults.standard.set(true, forKey: "isOnboardingCompleted")
        isOnboardingDone = true
    }
}

#Preview {
    OnBording()
}
 
