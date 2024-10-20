//
//  ChatView.swift
//  hibean
//
//  Created by Armond Schneider on 10/19/24.
//

import SwiftUI

struct ChatView: View {
    @State private var userInput: String = ""
    @State private var assistantResponse: String = "Hello! How can I help you today?"
    
    var body: some View {
        VStack {
            ScrollView {
                Text(assistantResponse)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(height: 200)
            .border(Color.gray, width: 1)

            HStack {
                TextField("Type something...", text: $userInput, onCommit: {
                    processUserInput()
                    checkForReturnKey()
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                Button("Send", action: {
                    processUserInput()
                    checkForReturnKey()
                })
                .padding(.horizontal)
            }
            .padding()
        }
        .frame(width: 400, height: 300)
    }
    
    func processUserInput() {
        assistantResponse = "Processing: \(userInput)"
        userInput = ""
    }
    
    func checkForReturnKey() {
        if userInput.isEmpty {
            // Close window when return key is pressed
            if let delegate = NSApp.delegate as? AppDelegate {
                delegate.closeWindow()
            }
        }
    }
}
