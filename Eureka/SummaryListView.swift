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
  
            ZStack {
                Color.gray1
                .ignoresSafeArea(.all)

                    
                ZStack {
                    Image("backgrund")
                        .resizable()
                        .frame(width: 395, height: 150)
                        .padding(.bottom,60)

                    Text("Activity Summary")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.trailing, 100)
                     

                }.padding(.bottom,700)
                VStack{
                
                    
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
                                                    .padding([.top, .trailing])
                                                
                                                Button(action: {
                                                    withAnimation {
                                                        showAllStatements.toggle()
                                                    }
                                                }) {
                                                    Text(showAllStatements ? "See Less" : "See More")
                                                        .foregroundColor(.orange1)
                                                        .padding(.top,20)
                                                }
                                             
                                            }.padding(.horizontal)
                                            ScrollView {
                                                VStack(alignment: .leading) {
                                                    // Display only three statements initially or all if showAllStatements is true
                                                    ForEach(item.problemStatements.prefix(showAllStatements ? item.problemStatements.count : 3), id: \.self) { statement in
                                                        Text(statement)
                                                        
                                                            .padding(.leading,20)
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
                                        .frame(width: 41, height: 41)
                                        .foregroundColor(.orange1)
                                    VStack {
                                        Text("Fantastic work on sparking your big idea! Are you ready to dive even deeper and expand your creative horizons? ")
                                            .font(.callout)
                                            .bold()
                                        Text("Let's keep the momentum going try the other technique, it will enhance your ability to think outside the box and refine your concepts.")
                                            .font(.caption)
                                    }
                                }.padding(.horizontal)
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
                
                
            }
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
        ZStack{
            
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
        }.ignoresSafeArea(.all)
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

