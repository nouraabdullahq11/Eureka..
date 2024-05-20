//
//  EurekaApp.swift
//  Eureka
//
//  Created by Noura Alqahtani on 19/05/2024.
//

import SwiftUI
import SwiftData
import Firebase
import Lottie
@main

struct EurekaApp: App {
@StateObject var dataManager = DataManager()

init() {
    FirebaseApp.configure()
}
var body: some Scene {
    WindowGroup {
        NavigationStack{
            
            SplashScreen()
        }
        
    }
.modelContainer(for: DataItem.self)
.environmentObject(dataManager)    }
}

