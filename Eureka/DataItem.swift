//
//  DataItem.swift
//  Eureka
//
//  Created by Noura Alqahtani on 19/05/2024.
//


import Foundation
import SwiftData
@Model


class DataItem: Identifiable {
var id: String
var name: String
var type: String
var problemStatements: [String] // Array to hold multiple problem statements

init(name: String, type: String, problemStatements: [String] = []) {
    self.id = UUID().uuidString
    self.name = name
    self.type = type
    self.problemStatements = problemStatements
}
}





struct Word: Identifiable{
var id: String
var text: String
}

struct Question: Identifiable{
var id: String
var text: String
}

struct Answer: Identifiable{
    var id: String
    var text: String
}
//
//struct SummaryW: Identifiable {
//let id = UUID()
//let userInput: String
//let displayedWord: String
//}
//
//struct SummaryQ: Identifiable {
//let id = UUID()
//let userInput: String
//let displayedQuestion: String
//}

