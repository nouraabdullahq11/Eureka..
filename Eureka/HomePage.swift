//
//  HomePage.swift
//  Eureka
//
//  Created by Noura Alqahtani on 19/05/2024.
//


import SwiftUI
import SwiftData
struct HomePage: View {
    @State private var isSheetPresented = false
    @State private var isSheetPresented2 = false
    @State private var isSheetPresented3 = false
    @State private var isSheetPresented4 = false

    @State private var destinationViewIsActive = false
    @State private var destinationViewIsActive2 = false
    @State private var destinationViewIsActive3 = false
    @State private var destinationViewIsActive4 = false

    @Environment(\.modelContext) private var context
    @Query private var items: [DataItem] // Query to fetch all items
    @State private var navigateToSummary: Bool = false // Track if navigation to SummaryListView is triggered
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray1
                    .ignoresSafeArea()
                
                    VStack {
                        ZStack {
                            NavigationLink(destination: StartSession(likedWords: [], promtSelection: 0, generaterSelection: 0)) {
                                VStack {
                                    Image(.backgrund)
                                        .resizable()
                                        .frame(width: 325, height: 144)
                                        .cornerRadius(10)
                                        .overlay(
                                            Text("Unlock Your Imagination And Embrace Creativity through sequential techniques!")
                                                .font(.system(size: 13, weight: .regular))
                                                .fontWeight(.regular)
                                                .foregroundColor(.white)
                                                .multilineTextAlignment(.center)
                                                .padding(.bottom, 50.0)
                                        )
                                        .overlay(
                                            Text("Start Session")
                                                .font(.title3)
                                                .bold()
                                                .foregroundColor(.white)
                                                .padding(.top, 80.0)
                                        )
                                }
                            }
                        }
                        .padding(.top, 40)

                        Text("Try Technique")
                            .fontWeight(.bold)
                            .padding(.trailing, 220)
                            .padding(.top, 30)

                        VStack(alignment: .leading) {
                            HStack {
                                Button(action: {
                                    isSheetPresented.toggle()
                                }) {
                                    Image(colorScheme == .dark ? "darkModeImage" : "BUTTONIMAGE")
                                        .resizable()
                                        .frame(width: 160, height: 100)
                                        .overlay(
                                            Text("Random Words")
                                                .font(.caption)
                                                .bold()
                                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                        )
                                }
                                .sheet(isPresented: $isSheetPresented) {
                                    SheetRandomWords(isSheetPresented: $isSheetPresented, destinationViewIsActive: $destinationViewIsActive)
                                        .presentationDetents([.medium, .large])
                                }
                                .background(
                                    NavigationLink(destination: try_RandomWords(), isActive: $destinationViewIsActive) {
                                        EmptyView()
                                    }
                                    .hidden()
                                )

                                Button(action: {
                                    isSheetPresented2.toggle()
                                }) {
                                    Image(colorScheme == .dark ? "darkModeImage2" : "buttonimage2")
                                        .resizable()
                                        .frame(width: 160, height: 100)
                                        .overlay(
                                            Text("Answer The Question")
                                                .font(.caption)
                                                .bold()
                                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                        )
                                }
                                .sheet(isPresented: $isSheetPresented2) {
                                    SheetQuestion(isSheetPresented2: $isSheetPresented2, destinationViewIsActive2: $destinationViewIsActive2)
                                        .presentationDetents([.medium, .large])
                                }
                                .background(
                                    NavigationLink(destination: try_AnsQuestions(), isActive: $destinationViewIsActive2) {
                                        EmptyView()
                                    }
                                    .hidden()
                                )
                            }
                            HStack {
                                Button(action: {
                                    isSheetPresented3.toggle()
                                }) {
                                    Image(colorScheme == .dark ? "darkModeImage3" : "buttonimage3")
                                        .resizable()
                                        .frame(width: 160, height: 100)
                                        .overlay(
                                            Text("Revers Brainstorming")
                                                .font(.caption)
                                                .bold()
                                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                        )
                                }
                                .sheet(isPresented: $isSheetPresented3) {
                                    SheetBrainstorming(isSheetPresented3: $isSheetPresented3, destinationViewIsActive3: $destinationViewIsActive3)
                                        .presentationDetents([.medium, .large])
                                }
                                .background(
                                    NavigationLink(destination: try_ReverseBrainstorming(), isActive: $destinationViewIsActive3) {
                                        EmptyView()
                                    }
                                    .hidden()
                                )

                                Button(action: {
                                    isSheetPresented4.toggle()
                                }) {
                                    Image(colorScheme == .dark ? "darkModeImage4" : "buttonimage4")
                                        .resizable()
                                        .frame(width: 160, height: 100)
                                        .overlay(
                                            Text("crazy 8")
                                                .font(.caption)
                                                .bold()
                                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                        )
                                }
                                .sheet(isPresented: $isSheetPresented4) {
                                    sheetsCrazy8(isSheetPresented4: $isSheetPresented4, destinationViewIsActive4: $destinationViewIsActive4)
                                        .presentationDetents([.medium, .large])
                                }
                                .background(
                                    NavigationLink(destination: try_Crazy8(), isActive: $destinationViewIsActive4) {
                                        EmptyView()
                                    }
                                    .hidden()
                                )
                            }
                        }
                        .padding()

                        HStack {
                                        Text("Your sessions")
                                            .fontWeight(.bold)
                                            .padding(.trailing, 140)
                                            .padding(.top, 10)
                                        
                                        NavigationLink(destination: SummaryListView(items: items), isActive: $navigateToSummary) {
                                            EmptyView()
                                        }
                                        .hidden()
                                        
                                        Button(action: {
                                            navigateToSummary = true // Trigger navigation to SummaryListView
                                        }) {
                                            Text("see more")
                                                .foregroundColor(.orange)
                                                .underline()
                                                .padding(.top, 10)
                                        }
                                    }
                                    
                        VStack(alignment: .trailing) {
           if let lastItem = items.last { // Fetching the last item from the items array
                       NavigationLink(destination: DetailsView(item: lastItem)) {
                              
                            Image(colorScheme == .dark ? "BoxSession" : "BoxSession1")
                               .resizable()
                                            .frame(width: 390, height: 105)
                                            .shadow(radius: 2)
                                        
                                            .overlay(
                                        ZStack {
                                            HStack{
                                                Image("lightbulb")
                                                    .resizable()
                                                    .frame(width: 17, height: 18)
                                                    .foregroundColor(.orange)
                                               // .padding(.trailing, 10)
                                                
                                                Text(lastItem.name)
                                                    .fontWeight(.bold)
                                                    .lineLimit(1) 

                                                    .overlay(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.red, .orange]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                        .mask(Text(lastItem.name)
                                                .fontWeight(.bold)     )
                                                    
                                                    )
                                               
                                            }.frame(width: 320, height: 55, alignment: .topLeading)

                                                HStack {
                                                    Text(lastItem.type)
                                                 .font(.system(size: 15, weight: .regular))
                                                 .foregroundColor(colorScheme == .dark ? .white : .black)
                                                .lineLimit(1)
                                               
                                              
                                                    
                                                }.frame(width: 270, height: 40, alignment: .leadingLastTextBaseline)
                         
                                        }
                                        )
                                  //  }
                                }
                            }
                        }
                        .padding(.top, 10)
                    }
                    .padding(.bottom, 100)
                

               
                Image("image2")
                    .resizable()
                    .frame(width: 393, height: 69)
                    .scaledToFit()
                    .scaleEffect(y: 1.2)
                    .padding(.bottom, 810)

                Image("image1")
                    .resizable()
                    .frame(width: 393, height: 69)
                    .padding(.top, 760)
            }.ignoresSafeArea(.all)
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
HomePage()
}

