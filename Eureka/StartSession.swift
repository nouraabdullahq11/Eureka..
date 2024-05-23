//
//  StartSession.swift
//  Eureka
//
//  Created by Noura Alqahtani on 19/05/2024.
//
//
// 

import SwiftUI
import SwiftData

struct StartSession: View {
    struct TopLeadingTextFieldStyle: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .multilineTextAlignment(.leading)
                .padding(.leading) // Push text to the left
               // .padding(.bottom) // Push text to the top
        }
    }
    
@Environment(\.colorScheme) var colorScheme
    
//@State private var isSessionStarted: Bool = false // Track if session started
    var likedWords: [String]
@State private var TextInbut = ""
@State private var TextInbut2 = ""

//    @State public var stepOneChoice: Int
//    @State public var stepTwoChoice: Int

@State private var conditionMetOneChoice = false
@State private var conditionMetTwoChoice = false

@State private var selectedButtonIndex: Int?
@State private var selectedButtonIndex1: Int?


@State private var isPressed1 = false
@State private var isPressed2 = false
@State private var isPressed3 = false
@State private var isPressed4 = false

// // // // // //

@Environment(\.modelContext) private var context
@Query private var items: [DataItem] // Query to fetch all items

@State private var sessionName: String = ""
@State private var sessionType: String = ""

@State private var isSessionStarted: Bool = false // Track if session started
@State private var navigateToSummary: Bool = false // Track if navigation to SummaryListView is triggered
@State var promtSelection: Int
@State var generaterSelection: Int

var body: some View {
    NavigationView{
        VStack{
            ZStack{
                Color.gray1
                    .ignoresSafeArea()
                
                ZStack{
                    Image("backgrund")
                        .resizable()
                        .frame(width: 399, height: 150)
                        .ignoresSafeArea()
                    Text("Start Session")
                        .font(.title)
                        .bold()
                        .foregroundColor(colorScheme == .dark ? .gray1 : .white)
                      
                        .padding(.trailing,180)
                    
                }   .padding(.bottom,650)
                VStack{
                    Text("Enter session name")
                        .font(.callout)
                        .padding(.trailing , 180)
                    
                    ZStack(alignment: .topLeading) {
                    TextField("", text: $sessionName)
                            .frame(maxWidth: .infinity)
                            .frame(width: 332 , height: 42)
                        .background(colorScheme == .dark ? Color.gray1 : Color.white)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                .overlay(
                                                
                        RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray2, lineWidth: 1)
                                       )
                    .textFieldStyle(TopLeadingTextFieldStyle())
//                                .padding()
                                .onSubmit {
                                print(TextInbut)
                                            }
                                .padding()
                        }
                    Text("Enter session type")
                        .font(.callout)
                        .padding(.trailing , 180)
                    ZStack(alignment: .topLeading) {
                        TextField("", text: $sessionType)
                            .frame(maxWidth: .infinity)
                            .frame(width: 332 , height: 42)
                            .background(colorScheme == .dark ? Color.gray1 : Color.white)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .overlay(
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray2, lineWidth: 1)
                            )
                            .textFieldStyle(TopLeadingTextFieldStyle())
                            .padding()
                            .onSubmit {
                                print(TextInbut2)
                            }
                    }
                    
//                    TextField("", text: $TextInbut2)
//                        .textFieldStyle(.roundedBorder)
//                        .frame(width: 332)
//                        .cornerRadius(10)
//                        .font(.system(size: 27))
//                        .padding(.bottom , 40)
//                        .onSubmit {
//                            print(TextInbut2)
//                        }
                    // هذي لازم تنشال بعدين ضفتها للاختصار فقط مفروض تكون مع النافقيشن حق زر ال start الي تحت !!!!!!!!!!!!
//                        Button("Start session") {
//                            addItem(sessionName: sessionName)
//                            sessionName = ""
//                        }
//                        .disabled(sessionName.isEmpty)
//
                    HStack {
                        Text("Step 1")
                            .font(.callout)
                            .fontWeight(.bold) // Make "Step One Idea list prompts :" bold
                        Text("Idea list prompts :")
                            .font(.callout)
                    }
                    .frame(width: 500)
                    .padding(.trailing, 130)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    
                    HStack{
                        
                        
                        Button(action: {
                            
                            promtSelection = 1
                            selectedButtonIndex = 0
                            
                        }, label: {
                            
             
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray2, lineWidth: 1)
                                .frame(width: 160,height: 51)
                                .background(
                               selectedButtonIndex == 0 ? Color.orange2 : (colorScheme == .dark ? Color.gray1 : Color.white)
                           )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    Text(" Random words")
                                        .font(.caption)
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                )
                            
                            
                        }   )
                        
                        ///
                        
                        Button(action: {
                            
                            promtSelection = 2
                            selectedButtonIndex = 1
                            
                        }, label: {
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray2, lineWidth: 1)
                                .frame(width: 160,height: 51)
                                .background(
                               selectedButtonIndex == 1 ? Color.orange2 : (colorScheme == .dark ? Color.gray1 : Color.white)
                           )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    Text(" answer the question")
                                        .font(.caption)
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black))
                        })
                    }
                    
                    
                    
                    
                    HStack {
                        Text("Step 2 ")
                            .font(.callout)
                            .fontWeight(.bold) // Make "Step 2" bold
                        
                        Text("Brainstorming list :") // The rest of the text remains regular
                            .font(.callout)
                    }.frame(width: 500)
                        .padding(.trailing ,120)
                        .padding(.top ,20)
                        .padding(.bottom ,10)
                    
                    HStack{
                        
                        Button(action: {
                            
                            generaterSelection = 1
                            selectedButtonIndex1 = 0
                        }, label: {
                            
                            
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray2, lineWidth: 1)
                                .frame(width: 160,height: 51)
                                .background(
                               selectedButtonIndex1 == 0 ? Color.orange2 : (colorScheme == .dark ? Color.gray1 : Color.white)
                           )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    Text("Crazy 8")
                                        .font(.caption)
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black))
                        })
                        
                        
                        
                        Button(action: {
                            
                            generaterSelection = 2
                            selectedButtonIndex1 = 1
                            
                        }, label: {
                            
                            
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray2, lineWidth: 1)
                                .frame(width: 160,height: 51)
                                .background(
                               selectedButtonIndex1 == 1 ? Color.orange2 : (colorScheme == .dark ? Color.gray1 : Color.white)
                           )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    Text("reverse brainstorming")
                                        .font(.caption)
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                    
                                )
                        })
                        
                    } //.padding()
                }
                
                VStack{
                    if promtSelection == 1{
                        NavigationLink(destination: session_RandomWords(items: items, sessionName: sessionName, sessionType: sessionType, generaterSelection:$generaterSelection), isActive: $isSessionStarted) {
                                   EmptyView() // Empty view to trigger navigation
                              }
                    }
                    else{
                        NavigationLink(destination: session_AnsQuestions(likedWords: likedWords, items: items, sessionName: sessionName, sessionType: sessionType, generaterSelection:$generaterSelection), isActive: $isSessionStarted) {
                                   EmptyView() // Empty view to trigger navigation
                              }
                    }
                      
                    Button("Start") {
                        startSession()
                        // Check the session name right after it's supposed to be set
                        print("Session Name on Save: \(sessionName)")
                        print("Session Name on Save: \(sessionType)")
                    } .font(.system(size: 18))
                       // .padding()
//                            .background(likedWords.count >= 3 ? Color.orange : Color.gray)
                        .frame(width: 337, height: 39)
                        .background(Color.button)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 5))

                    .disabled(sessionName.isEmpty)
                    
                    
                }.padding(.top,650)
                
                
                // }
                // }
                
                
                
                
            }
            
        }
        
        
        
    }
}

    func addItem(sessionName: String, sessionType: String) {
    let item = DataItem(name: sessionName,type: sessionType)
    context.insert(item)
}


func startSession() {
print("Starting session with name: \(sessionName)")
print("Starting session with name: \(sessionType)")
addItem(sessionName: sessionName, sessionType: sessionType)
isSessionStarted = true
}

}



#Preview {
    StartSession(likedWords: ["Example Word 1", "Example Word 2"], promtSelection: 0, generaterSelection: 0)
}
