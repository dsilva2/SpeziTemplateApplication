//
//  Models.swift
//  TemplateApplication
//
//  Created by Drew Silva on 12/2/24.
//

import Foundation

struct Message: Identifiable {
    let id = UUID()
    let sender: String
    let recipient: String
    let content: String
}

struct Conversation: Identifiable {
    let id: String // Firestore document ID
    let messages: [Message]
}

