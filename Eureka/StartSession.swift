import SwiftUI
import SwiftData

struct StartSession: View {
struct TopLeadingTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .multilineTextAlignment(.leading)
            .padding(.leading)
    }
}

@Environment(\.colorScheme) var colorScheme

var likedWords: [String]
@State private var TextInbut = ""
@State private var TextInbut2 = ""
@State private var conditionMetOneChoice = false
@State private var conditionMetTwoChoice = false
@State private var selectedButtonIndex: Int?
@State private var selectedButtonIndex1: Int?
@State private var isPressed1 = false
@State private var isPressed2 = false
@State private var isPressed3 = false
@State private var isPressed4 = false
@Environment(\.modelContext) private var context
@Query private var items: [DataItem]
@State private var sessionName: String = ""
@State private var sessionType: String = ""
@State private var isSessionStarted: Bool = false
@State private var navigateToSummary: Bool = false
@State var promtSelection: Int
@State var generaterSelection: Int

var body: some View {
    GeometryReader { geometry in
        NavigationView {
            VStack {
                ZStack {
                    Color.gray1
                        .ignoresSafeArea()
                    
                    VStack(spacing: 0) {
                        ZStack {
                            Image("backgrund")
                                        .resizable()
                                    .scaledToFill()
                                        .frame(width: geometry.size.width, height: geometry.size.height * 0.10) // Adjusted height
                                            //.clipped()
                            
                                        Text("Start Session")
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(colorScheme == .dark ? .gray1 : .white)
                                                               .padding(.trailing, 180) // Adjust the padding to move text to the left
                                                              // .padding(.top, geometry.safeAreaInsets.top + 0.01)
                                                //               .padding(.bottom,50)
                        }
                        
                        ScrollView {
                            VStack(spacing: 20) {
                                sessionDetailsSection
                                stepsSection
                                startButton
                                navigationLinks
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity)
                        }
                        .background(Color.gray1)
                    }
                }
            }
        }
    }
}

private var sessionDetailsSection: some View {
    VStack(alignment: .leading, spacing: 30) {
               Text("Enter session name")
            .font(.callout)
            .padding(.top,50)
        customTextField(text: $sessionName)
        
        Text("Enter session type")
            .font(.callout)
        
        customTextField(text: $sessionType)
    }
}

private func customTextField(text: Binding<String>) -> some View {
    TextField("", text: text)
        .frame(maxWidth: .infinity)
        .frame(height: 42)
        .background(colorScheme == .dark ? Color.gray1 : Color.white)
        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray2, lineWidth: 1)
        )
        .textFieldStyle(TopLeadingTextFieldStyle())
}

private var stepsSection: some View {
    VStack(alignment: .leading, spacing: 30) {
        stepHeader(title: "Step 1", subtitle: "Idea list prompts :")
        stepButtons(selection: $promtSelection, selectedIndex: $selectedButtonIndex, labels: ["Random words", "Answer the question"])
        
        stepHeader(title: "Step 2", subtitle: "Brainstorming list :")
        stepButtons(selection: $generaterSelection, selectedIndex: $selectedButtonIndex1, labels: ["Crazy 8", "Reverse brainstorming"])
    }
}

private func stepHeader(title: String, subtitle: String) -> some View {
    HStack {
        Text(title)
            .font(.callout)
            .fontWeight(.bold)
        Text(subtitle)
            .font(.callout)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}

private func stepButtons(selection: Binding<Int>, selectedIndex: Binding<Int?>, labels: [String]) -> some View {
    HStack(spacing: 20) {
        ForEach(0..<labels.count, id: \.self) { index in
            Button(action: {
                selection.wrappedValue = index + 1
                selectedIndex.wrappedValue = index
            }) {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray2, lineWidth: 1)
                    .frame(height: 51)
                    .frame(maxWidth: .infinity)
                    .background(
                        selectedIndex.wrappedValue == index ? Color.orange2 : (colorScheme == .dark ? Color.gray1 : Color.white)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        Text(labels[index])
                            .font(.caption)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    )
            }
        }
    }
}

private var navigationLinks: some View {
    VStack {
        if promtSelection == 1 {
            NavigationLink(destination: session_RandomWords(items: items, sessionName: sessionName, sessionType: sessionType, generaterSelection: $generaterSelection), isActive: $isSessionStarted) {
                EmptyView()
            }
        } else {
            NavigationLink(destination: session_AnsQuestions(likedWords: likedWords, items: items, sessionName: sessionName, sessionType: sessionType, generaterSelection: $generaterSelection), isActive: $isSessionStarted) {
                EmptyView()
            }
        }
    }
}

private var startButton: some View {
    Button("Start") {
        startSession()
    }
    .font(.system(size: 18))
    .frame(height: 39)
    .frame(maxWidth: .infinity)
    .background(Color.button)
    .foregroundColor(.white)
    .clipShape(RoundedRectangle(cornerRadius: 5))
    .disabled(sessionName.isEmpty)
    .padding(.top,90)
}

func addItem(sessionName: String, sessionType: String) {
    let item = DataItem(name: sessionName, type: sessionType)
    context.insert(item)
}

func startSession() {
    print("Starting session with name: \(sessionName)")
    print("Starting session with type: \(sessionType)")
    addItem(sessionName: sessionName, sessionType: sessionType)
    isSessionStarted = true
}
}

#Preview {
StartSession(likedWords: ["Example Word 1", "Example Word 2"], promtSelection: 0, generaterSelection: 0)
}
