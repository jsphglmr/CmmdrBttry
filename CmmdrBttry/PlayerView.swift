//
//  PlayerView.swift
//  CmmdrBttry
//
//  Created by Joseph Gilmore on 5/23/25.
//

import SwiftUI

struct PlayerView: View {
    @Binding var player: Player
    @State private var showingCommanderDamage = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(player.color, lineWidth: 2)
                )
            
            VStack {
                // Player name
                Text(player.name)
                    .font(.headline)
                    .foregroundColor(player.color)
                    .padding(.top, 8)
                
                Spacer()
                
                // Life total
                Text("\(player.life)")
                    .font(.system(size: 52, weight: .bold, design: .rounded))
                    .foregroundColor(player.life <= 10 ? .red : .primary)
                
                Spacer()
                
                // Life adjustment buttons
                HStack(spacing: 20) {
                    LifeButton(value: -5, color: Color(red: 0.9, green: 0, blue: 0.2)) {
                        adjustLife(by: -5)
                    }
                    LifeButton(value: -1, color: Color(red: 0.9, green: 0.25, blue: 0.25)) {
                        adjustLife(by: -1)
                    }
                    LifeButton(value: 1, color: Color(red: 0.25, green: 0.65, blue: 0.25)) {
                        adjustLife(by: 1)
                    }
                    LifeButton(value: 5, color: Color(red: 0.25, green: 0.8, blue: 0.25)) {
                        adjustLife(by: 5)
                    }
                }
                
                // Commander damage button
                Button("Commander Damage") {
                    showingCommanderDamage = true
                }
                .font(.caption)
                .foregroundColor(player.color)
                .padding(.bottom, 8)
            }
        }
        .sheet(isPresented: $showingCommanderDamage) {
            CommanderDamageView(player: $player)
        }
    }
    
    private func adjustLife(by amount: Int) {
        withAnimation(.easeInOut(duration: 0.2)) {
            player.life += amount
        }
    }
}
