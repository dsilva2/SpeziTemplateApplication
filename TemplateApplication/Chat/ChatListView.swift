//
//  ChatListView.swift
//  TemplateApplication
//
//  Created by Drew Silva on 12/1/24.
//

import SwiftUI

struct ChatListView: View {
    @State private var isNewChatPresented = false

    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: ChatTestView()) {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.blue)
                        VStack(alignment: .leading) {
                            Text("Assistant Conversation")
                                .font(.headline)
                            Text("Assistant Message!")
                                .font(.subheadline)
                                .foregroundColor(.gray)
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
            NewChatView() // Pull up new chat screen
        }
    }
}
