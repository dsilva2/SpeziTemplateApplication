//
//  ChatView.swift
//  TemplateApplication
//
//  Created by Drew Silva on 12/1/24.
//

import SpeziChat
import SwiftUI

struct ChatTestView: View {
    @State private var chat: Chat = [
        ChatEntity(role: .assistant, content: "Assistant Message!")
    ]


    var body: some View {
        VStack {
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
                Text("Assistant")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                    
            }
//            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.1))
            .padding(.bottom, 10)
            ChatView($chat, exportFormat: .pdf)
                .navigationTitle("SpeziChat")
        }
    }
}
