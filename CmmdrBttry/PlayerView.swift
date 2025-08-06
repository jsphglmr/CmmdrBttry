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
    let onLifeChange: () -> Void
    
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
                
                // Poison counters display (if any)
                if player.poisonCounters > 0 {
                    HStack {
                        Image(systemName: "drop.fill")
                            .foregroundColor(.green)
                        Text("☠️ \(player.poisonCounters)")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(player.poisonCounters >= 10 ? .red : .green)
                    }
                    .padding(.top, 4)
                }
                
                // Energy counters display (if any)
                if player.energyCounters > 0 {
                    HStack {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.yellow)
                        Text("⚡ \(player.energyCounters)")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.yellow)
                    }
                    .padding(.top, 2)
                }
                
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
                
                // Poison counter adjustment buttons
                HStack(spacing: 15) {
                    Button("-") {
                        if player.poisonCounters > 0 {
                            onLifeChange() // Save state before change
                            let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                            impactFeedback.impactOccurred()
                            player.poisonCounters -= 1
                        }
                    }
                    .font(.caption)
                    .foregroundColor(.red)
                    .frame(width: 25, height: 20)
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(4)
                    
                    Text("☠️ \(player.poisonCounters)")
                        .font(.caption)
                        .foregroundColor(player.poisonCounters >= 10 ? .red : .green)
                        .frame(minWidth: 40)
                    
                    Button("+") {
                        onLifeChange() // Save state before change
                        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                        impactFeedback.impactOccurred()
                        player.poisonCounters += 1
                    }
                    .font(.caption)
                    .foregroundColor(.green)
                    .frame(width: 25, height: 20)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(4)
                }
                .padding(.top, 8)
                
                // Energy counter adjustment buttons
                HStack(spacing: 15) {
                    Button("-") {
                        if player.energyCounters > 0 {
                            onLifeChange() // Save state before change
                            let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                            impactFeedback.impactOccurred()
                            player.energyCounters -= 1
                        }
                    }
                    .font(.caption)
                    .foregroundColor(.orange)
                    .frame(width: 25, height: 20)
                    .background(Color.orange.opacity(0.1))
                    .cornerRadius(4)
                    
                    Text("⚡ \(player.energyCounters)")
                        .font(.caption)
                        .foregroundColor(.yellow)
                        .frame(minWidth: 40)
                    
                    Button("+") {
                        onLifeChange() // Save state before change
                        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                        impactFeedback.impactOccurred()
                        player.energyCounters += 1
                    }
                    .font(.caption)
                    .foregroundColor(.yellow)
                    .frame(width: 25, height: 20)
                    .background(Color.yellow.opacity(0.1))
                    .cornerRadius(4)
                }
                .padding(.top, 4)
                
                // Commander damage button
                Button("Commander Damage") {
                    let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                    impactFeedback.impactOccurred()
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
        // Save state before making changes
        onLifeChange()
        
        // Haptic feedback based on the type of change
        let impactFeedback = UIImpactFeedbackGenerator(style: amount < 0 ? .medium : .light)
        impactFeedback.impactOccurred()
        
        withAnimation(.easeInOut(duration: 0.2)) {
            player.life += amount
        }
    }
}
