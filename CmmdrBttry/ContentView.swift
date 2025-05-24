//
//  ContentView.swift
//  CmmdrBttry
//
//  Created by Joseph Gilmore on 5/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [Player] = [
        Player(name: "Player 1", life: 40, color: .red),
        Player(name: "Player 2", life: 40, color: .red),
        Player(name: "Player 3", life: 40, color: .red),
        Player(name: "Player 4", life: 40, color: .red)
    ]
    
    @State private var showingResetAlert = false
    @State private var showingSettings = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                
                // Landscape layout - 2x2 grid
                VStack(spacing: 10) {
                    HStack(spacing: 10) {
                        PlayerView(player: $players[0])
                        PlayerView(player: $players[1])
                    }
                    HStack(spacing: 10) {
                        PlayerView(player: $players[2])
                        PlayerView(player: $players[3])
                    }
                }
                
            }
            .navigationTitle("Commander")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Reset") {
                        showingResetAlert = true
                    }
                    .foregroundColor(.red)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingSettings = true
                    } label: {
                        Image(systemName: "gear")
                            .tint(.red)
                    }

                }
            }
        }
        .alert("Reset Game", isPresented: $showingResetAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Reset", role: .destructive) {
                resetGame()
            }
        } message: {
            Text("This will reset all players to 40 life. Are you sure?")
        }
        .sheet(isPresented: $showingSettings) {
            SettingsView(players: $players)
        }
    }
    
    private func resetGame() {
        for i in 0..<players.count {
            players[i].life = 40
            players[i].commanderDamage = [0, 0, 0, 0]
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

