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

    var body: some View {
        SetupScreenView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Player.self, inMemory: true)
}
