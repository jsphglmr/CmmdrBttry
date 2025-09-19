//
//  ContentView.swift
//  CmmdrBttry
//
//  Created by Joseph Gilmore on 5/19/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var players: [Player]
    @State private var navigationPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            SetupScreenView()
                .navigationDestination(for: Int.self) { playerCount in
                    GameView(playerCount: playerCount)
                }
        }
        .onReceive(NotificationCenter.default.publisher(for: .resetGame)) { _ in
            // Reset navigation to go back to setup screen
            navigationPath = NavigationPath()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Player.self, inMemory: true)
}
