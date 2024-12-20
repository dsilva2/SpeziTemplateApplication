//
//  ChatView.swift
//  TemplateApplication
//
//  Created by Drew Silva on 12/1/24.
//

import SpeziChat
import SwiftUI

struct ChatTestView: View {
    @Binding var conversation: Conversation
    @State private var chat: Chat = [
    ]
    init(conversation: Binding<Conversation>) {
        self._conversation = conversation
        self._chat = State(initialValue: conversation.wrappedValue.messages.map { message in
            ChatEntity(role: message.sender == "Me" ? .user : .assistant, content: message.content)
        })
    }


    var body: some View {
        VStack {
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
                Text(conversation.messages.first?.recipient ?? "Unknown")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                    .padding(.bottom, 10)
            }
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.1))
            .padding(.bottom, 10)

            ChatView($chat)
            .onChange(of: chat) { _, newChat in
                handleNewMessage(newChat)
            }
        }
    }
    private func handleNewMessage(_ newChat: Chat) {
        guard let lastMessage = newChat.last, lastMessage.role == .user else { return }

        // store new messages
        let newMessage = Message(
            chatId: UUID().uuidString,
            sender: "Me",
            recipient: conversation.messages.first?.recipient ?? "Unknown",
            content: lastMessage.content
        )
        conversation.messages.append(newMessage)
    }
}
