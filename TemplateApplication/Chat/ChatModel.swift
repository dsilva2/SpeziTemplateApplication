//
//  ChatModel.swift
//  TemplateApplication
//
//  Created by Drew Silva on 12/2/24.
//

import Foundation
import SwiftUI


struct Message: Identifiable {
    let id = UUID().uuidString
    let chatId: String
    let sender: String
    let recipient: String
    let content: String
}

struct Conversation: Identifiable {
    let id: String
    var messages: [Message]
}


class ChatModel: ObservableObject {
    @Published var chats: [Conversation] = []

    init() {
        // Hard code assistant chat
        let assistantChat = Conversation(
            id: UUID().uuidString,
            messages: [
                Message(
                    chatId: UUID().uuidString,
                    sender: "Me",
                    recipient: "Assistant",
                    content: "Assistant Message!"
                )
            ]
        )
        chats.append(assistantChat)
    }

    func addChat(contactName: String, initialMessage: String) {
        let newChat = Conversation(
            id: UUID().uuidString,
            messages: [
                Message(
                    chatId: UUID().uuidString,
                    sender: "Me",
                    recipient: contactName,
                    content: initialMessage
                )
            ]
        )
        chats.append(newChat)
    }
}
