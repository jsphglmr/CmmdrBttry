//
//  SettingsView.swift
//  CmmdrBttry
//
//  Created by Joseph Gilmore on 5/23/25.
//

import SwiftUI

struct SettingsView: View {
    @Binding var players: [Player]
    @Binding var startingLife: Int
    @Binding var isDarkMode: Bool
    @Environment(\.dismiss) private var dismiss
    
    // Predefined MTG colors
    private let availableColors: [Color] = [
        .red,           // Red
        .blue,          // Blue
        .green,         // Green
        .black,         // Black
        .white,         // White
        .orange,        // Orange
        .purple,        // Purple
        .pink,          // Pink
        .yellow,        // Yellow
        .cyan           // Cyan
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section("Player Names & Colors") {
                    ForEach(0..<players.count, id: \.self) { index in
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Circle()
                                    .fill(players[index].color)
                                    .frame(width: 20, height: 20)
                                
                                TextField("Player \(index + 1)", text: $players[index].name)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                            
                            // Color picker
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8) {
                                    ForEach(availableColors, id: \.self) { color in
                                        Button {
                                            players[index].color = color
                                        } label: {
                                            Circle()
                                                .fill(color)
                                                .frame(width: 30, height: 30)
                                                .overlay(
                                                    Circle()
                                                        .stroke(players[index].color == color ? Color.primary : Color.clear, lineWidth: 2)
                                                )
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                                .padding(.horizontal, 4)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                
                Section("Starting Life") {
                    Picker("Starting Life", selection: $startingLife) {
                        Text("20 Life").tag(20)
                        Text("30 Life").tag(30)
                        Text("40 Life").tag(40)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("Current: \(startingLife) life")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Section("Appearance") {
                    Toggle("Dark Mode", isOn: $isDarkMode)
                    
                    Text("Dark mode saves battery and is easier on the eyes during long games.")
                        .font(.caption)
                        .foregroundColor(.secondary)
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
