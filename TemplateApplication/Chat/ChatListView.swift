//
//  ChatListView.swift
//  TemplateApplication
//
//  Created by Drew Silva on 12/1/24.
//

import SwiftUI

struct ChatListView: View {
    @StateObject private var chatModel = ChatModel()
    @State private var isNewChatPresented = false

    var body: some View {
        NavigationStack {
            List($chatModel.chats) { $chat in
                NavigationLink(destination: ChatTestView(conversation: $chat)) {
                    VStack(alignment: .leading) {
                        Text(chat.messages.first?.recipient ?? "Unknown Contact")
                            .font(.headline)
                        if let lastMessage = chat.messages.last {
                            Text(lastMessage.content)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .lineLimit(1)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("Chats")
            .overlay(
                Button(action: {
                    isNewChatPresented = true
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                .padding(.trailing, 20)
                .padding(.bottom, 20),
                alignment: .bottomTrailing
            )
        }
        .sheet(isPresented: $isNewChatPresented) {
            NewChatView(chatModel: chatModel) // Pull up new chat screen
        }
    }
}
