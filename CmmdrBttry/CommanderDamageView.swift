//
//  CommanderDamageView.swift
//  CmmdrBttry
//
//  Created by Joseph Gilmore on 5/23/25.
//

import SwiftUI

struct CommanderDamageView: View {
    @Binding var player: Player
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Commander Damage to \(player.name)")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                VStack(spacing: 15) {
                    ForEach(0..<4, id: \.self) { index in
                        if index != getPlayerIndex() {
                            HStack {
                                Text("From Player \(index + 1):")
                                    .font(.headline)
                                
                                Spacer()
                                
                                HStack(spacing: 15) {
                                    Button("-") {
                                        if player.commanderDamage[index] > 0 {
                                            player.commanderDamage[index] -= 1
                                        }
                                    }
                                    .buttonStyle(CommanderDamageButtonStyle(color: .red))
                                    
                                    Text("\(player.commanderDamage[index])")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .frame(minWidth: 30)
                                    
                                    Button("+") {
                                        player.commanderDamage[index] += 1
                                    }
                                    .buttonStyle(CommanderDamageButtonStyle(color: .green))
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                
                Spacer()
                
                Text("A player loses when they take 21+ commander damage from any single commander.")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .padding()
            .navigationTitle("Commander Damage")
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
    
    private func getPlayerIndex() -> Int {
        // This is a simplified way to get player index
        // In a real app, you'd want to pass this information properly
        return 0
    }
}
