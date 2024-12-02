//
//  ChatListView.swift
//  TemplateApplication
//
//  Created by Drew Silva on 12/1/24.
//

import SwiftUI

struct ChatListView: View {
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
        }
    }
}
