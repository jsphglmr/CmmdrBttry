//
//  SettingsView.swift
//  CmmdrBttry
//
//  Created by Joseph Gilmore on 5/23/25.
//

import SwiftUI

struct SettingsView: View {
    @Binding var players: [Player]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Section("Player Names") {
                    ForEach(0..<players.count, id: \.self) { index in
                        HStack {
                            Circle()
                                .fill(players[index].color)
                                .frame(width: 20, height: 20)
                            
                            TextField("Player \(index + 1)", text: $players[index].name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                }
                
                Section("Starting Life") {
                    Stepper("Starting Life: 40", value: .constant(40), in: 1...200)
                        .disabled(true)
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}
