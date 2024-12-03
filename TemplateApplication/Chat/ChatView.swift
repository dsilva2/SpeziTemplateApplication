//
//  ChatView.swift
//  TemplateApplication
//
//  Created by Drew Silva on 12/1/24.
//

import SpeziChat
import SwiftUI

struct ChatTestView: View {
    let conversation: Conversation
    @State private var chat: Chat = [
    ]
    init(conversation: Conversation) {
            self.conversation = conversation
            self._chat = State(initialValue: conversation.messages.map { message in
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
        }
    }
}
