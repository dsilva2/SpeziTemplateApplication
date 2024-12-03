//
//  NewChatView.swift
//  TemplateApplication
//
//  Created by Drew Silva on 12/2/24.
//

import SwiftUI

struct NewChatView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedContactName: String = ""
    @State private var message: String = ""

    let contacts: [String] = speziContacts.map { contact in
        let givenName = contact.name.givenName ?? ""
        let familyName = contact.name.familyName ?? ""
        return "\(givenName) \(familyName)"
    }

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Select Contact")) {
                    Picker("Contact", selection: $selectedContactName) {
                        ForEach(contacts, id: \.self) { contact in
                            Text(contact)
                        }
                    }
                }

                Section(header: Text("Message")) {
                    TextField("Enter your message", text: $message)
                }
            }
            .navigationTitle("New Chat")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Send") {
                        dismiss()
                    }
                    .disabled(selectedContactName.isEmpty || message.isEmpty) // Ensure contact is selected and message is not empty
                }
            }
        }
    }
}
