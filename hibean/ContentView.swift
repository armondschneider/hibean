//
//  ContentView.swift
//  hibean
//
//  Created by Armond Schneider on 10/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var messages: [Message] = [Message(text: "What can I do for you?", isUser: false)]
    @State private var inputText: String = ""

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(messages) { message in
                        HStack {
                            if message.isUser {
                                Spacer()
                                Text(message.text)
                                    .padding()
                                    .background(Color.blue.opacity(0.8))
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                    .padding(.horizontal)
                            } else {
                                Text(message.text)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(12)
                                    .padding(.horizontal)
                                Spacer()
                            }
                        }
                    }
                }
            }
            .frame(maxHeight: .infinity)
            
            HStack {
                TextField("Type a message...", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button(action: sendMessage) {
                    Text("Send")
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .frame(width: 400, height: 500)
        .background(Color.white)
    }

    private func sendMessage() {
        let trimmedMessage = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedMessage.isEmpty else { return }
        
        // Add the user's message
        messages.append(Message(text: trimmedMessage, isUser: true))
        
        // Simulate a response (this can later be replaced with actual AI responses)
        let responseText = "Using AppleScript"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            messages.append(Message(text: responseText, isUser: false))
        }
        
        // Clear the input field
        inputText = ""
    }
}

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
