//
//  ContentView.swift
//  CmmdrBttry
//
//  Created by Joseph Gilmore on 5/19/24.
//

import SwiftUI

struct GameSnapshot {
    let players: [Player]
    let timestamp: Date
}

struct ContentView: View {
    @State private var startingLife: Int = 40
    @State private var isDarkMode: Bool = false
    @State private var players: [Player] = [
        Player(name: "Player 1", life: 40, startingLife: 40, color: .red),
        Player(name: "Player 2", life: 40, startingLife: 40, color: .blue),
        Player(name: "Player 3", life: 40, startingLife: 40, color: .green),
        Player(name: "Player 4", life: 40, startingLife: 40, color: .orange)
    ]
    
    @State private var gameHistory: [GameSnapshot] = []
    @State private var showingResetAlert = false
    @State private var showingSettings = false
    
    var canUndo: Bool {
        !gameHistory.isEmpty
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                
                // Landscape layout - 2x2 grid
                VStack(spacing: 10) {
                    HStack(spacing: 10) {
                        PlayerView(player: $players[0], onLifeChange: saveSnapshot)
                        PlayerView(player: $players[1], onLifeChange: saveSnapshot)
                    }
                    HStack(spacing: 10) {
                        PlayerView(player: $players[2], onLifeChange: saveSnapshot)
                        PlayerView(player: $players[3], onLifeChange: saveSnapshot)
                    }
                }
                
            }
            .navigationTitle("Commander")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Button("Reset") {
                            showingResetAlert = true
                        }
                        .foregroundColor(.red)
                        
                        if canUndo {
                            Button("Undo") {
                                undoLastChange()
                            }
                            .foregroundColor(.blue)
                        }
                    }
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
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .alert("Reset Game", isPresented: $showingResetAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Reset", role: .destructive) {
                resetGame()
            }
        } message: {
            Text("This will reset all players to \(startingLife) life. Are you sure?")
        }
        .sheet(isPresented: $showingSettings) {
            SettingsView(players: $players, startingLife: $startingLife, isDarkMode: $isDarkMode)
        }
    }
    
    private func saveSnapshot() {
        // Save current state before change
        let snapshot = GameSnapshot(players: players, timestamp: Date())
        gameHistory.append(snapshot)
        
        // Keep only last 10 snapshots to prevent memory issues
        if gameHistory.count > 10 {
            gameHistory.removeFirst()
        }
    }
    
    private func undoLastChange() {
        guard let lastSnapshot = gameHistory.popLast() else { return }
        
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
        
        withAnimation(.easeInOut(duration: 0.3)) {
            players = lastSnapshot.players
        }
    }
    
    private func resetGame() {
        gameHistory.removeAll()
        for i in 0..<players.count {
            players[i].life = startingLife
            players[i].startingLife = startingLife
            players[i].commanderDamage = [0, 0, 0, 0]
            players[i].poisonCounters = 0
            players[i].energyCounters = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

