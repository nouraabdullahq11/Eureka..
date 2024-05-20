//
//  SummaryListView.swift
//  Eureka
//
//  Created by Noura Alqahtani on 19/05/2024.
//

import SwiftUI


//import SwiftUI
struct DetailsView: View {
    var item: DataItem
    @State private var showAllStatements = false

    var body: some View {
        NavigationStack {
            ZStack{
            ScrollView {
                ZStack {
                    Color.gray1
                    VStack(spacing: 10) {
                        ZStack {
                            Image("backgrund")
                                .resizable()
                                .frame(width: 395, height: 150)
                            
                            Text("Activity Summary")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.trailing, 100)
                        }.padding()
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .shadow(radius: 3)
                                .frame(width: 361, height: 132)
                                .overlay(
                                    HStack {
                                        Image(systemName: "lightbulb.min")
                                            .resizable()
                                            .frame(width: 41, height: 53)
                                            .foregroundColor(.orange1)
                                        VStack {
                                            Text(" Research time :")
                                                .bold()
                                                .font(.title3)
                                                .padding(.trailing,20)
                                            Text(" By exploring, researching, and iterating, you're paving the way for success. Dive deeper into your big idea and you're on the path to something remarkable!")
                                                .font(.caption)
                                                .padding(.horizontal)
                                        }
                                    }.padding(.horizontal)
                                )
                        }
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .shadow(radius: 3)
                                .frame(width: 361, height: showAllStatements ? 300 : 132) // Set height dynamically
                            //  .padding(.trailing,20)
                                .overlay(
                                    VStack {
                                        HStack {
                                            Image(systemName: "doc.text")
                                                .resizable()
                                                .frame(width: 41, height: 53)
                                                .foregroundColor(.orange1)
                                            
                                            VStack(alignment: .leading, spacing: 8) {
                                                HStack{
                                                    Text("Your Answers:")
                                                        .bold()
                                                        .font(.title3)
                                                        .padding([.top, .trailing], 30)
                                                    
                                                    Button(action: {
                                                        withAnimation {
                                                            showAllStatements.toggle()
                                                        }
                                                    }) {
                                                        Text(showAllStatements ? "See Less" : "See More")
                                                            .foregroundColor(.orange1)
                                                            .padding(.top,20)
                                                    }
                                                    //.padding([.top, .trailing], 10)
                                                }
                                                ScrollView {
                                                    VStack(alignment: .leading) {
                                                        // Display only three statements initially or all if showAllStatements is true
                                                        ForEach(item.problemStatements.prefix(showAllStatements ? item.problemStatements.count : 3), id: \.self) { statement in
                                                            Text(statement)
                                                        }
                                                        
                                                        // If "See More" button is clicked, show all statements
                                                        if showAllStatements {
                                                            ForEach(item.problemStatements.dropFirst(3), id: \.self) { statement in
                                                                Text(statement)
                                                            }
                                                        }
                                                    }
                                                }.frame(height: showAllStatements ? 200 : 100) // Adjust the height of ScrollView to fit within the rectangle
                                            }
                                            Spacer()
                                        }
                                        .padding()
                                    }
                                )
                                .padding()
                            
                            
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .shadow(radius: 3)
                                .frame(width: 361, height: 200)
                                .overlay(
                                    HStack {
                                        Image(systemName: "checkmark.circle")
                                            .resizable()
                                            .frame(width: 41, height: 53)
                                            .foregroundColor(.orange1)
                                        VStack {
                                            Text("Fantastic work on sparking your big idea! Are you ready to dive even deeper and expand your creative horizons? ")
                                                .font(.callout)
                                                .bold()
                                            Text("Let's keep the momentum going try the other technique, it will enhance your ability to think outside the box and refine your concepts.")
                                                .font(.caption)
                                        }
                                    }
                                )
                        }.navigationBarBackButtonHidden(true)
                        
                        NavigationLink(destination: HomePage()) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 337, height: 39)
                                    .cornerRadius(5)
                                    .foregroundColor(.laitOrange)
                                Text("done")
                                    .foregroundColor(.white)
                            }.padding()
                        }
                    }
                    
                    
                }.ignoresSafeArea(.all)
            }.navigationBarBackButtonHidden(true)
        }
        }.navigationBarBackButtonHidden(true)
    }
}
struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct SummaryListView: View {
    var items: [DataItem]
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationView {
            List {
                ForEach(reversedItems()) { item in
                    NavigationLink(destination: DetailsView(item: item)) {
                        RoundedRectangleView(item: item)
                    }
                }
                .onDelete { indexes in
                    for index in indexes {
                        deleteItem(items[index])
                    }
                }
            }
            .navigationBarTitle("Sessions")
        }
    }
    struct RoundedRectangleView: View {
        var item: DataItem

        var body: some View {
            HStack {
                Image(systemName: "lightbulb.max.fill")
                    .foregroundColor(.orange1)
                    .padding(.trailing, 8)
                VStack{
                Text(item.name)
                    .bold()
                    .foregroundColor(.orange)
                Text(item.type)
                        .font(.caption)
                //.bold()
                   // .padding()
            }
                Spacer() // Ensures the HStack takes up the full width of the parent
            }
            .frame(maxWidth: .infinity) // Ensures the HStack takes up the full width of the parent
            .background(
                          //  RoundedRectangle(cornerRadius: 10)
                                (Color.white)
                                //.shadow(radius: 5)
            )
            .padding([.leading, .trailing], 10) // Optional: Add padding to the sides
        }
    }




func deleteItem(_ item: DataItem) {
    context.delete(item)
}

// Function to return items array with the last added session at the top
private func reversedItems() -> [DataItem] {
    var reversed = items
    reversed.reverse() // Reverse the array to have the last added session at the top
    return reversed
}
}
