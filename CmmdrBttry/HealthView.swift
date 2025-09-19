//
//  HealthView.swift
//  CmmdrBttry
//
//  Created by Joseph Gilmore on 5/25/24.
//

import SwiftUI

struct HealthView: View {
    var player: Player
    @State private var flashColor: Color = .white
    @State private var isAnimating = false
    
    var body: some View {
        // Show DeadView if player is dead
        if player.isDead {
            DeadView(player: player)
        } else {
            healthViewContent
        }
    }
    
    private var healthViewContent: some View {
        GeometryReader { geometry in
            ZStack {
                // Left half - Minus button (full height)
                Button {
                    flashRed()
                    player.health -= 1
                } label: {
                    Rectangle()
                        .fill(Color.clear)
                        .overlay(
                            Image(systemName: "minus")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.white)
                        )
                }
                .frame(width: geometry.size.width / 2, height: geometry.size.height)
                .contentShape(Rectangle())
                .buttonRepeatBehavior(.enabled)
                .position(x: geometry.size.width / 4, y: geometry.size.height / 2)
                
                // Right half - Plus button (full height)
                Button {
                    flashGreen()
                    player.health += 1
                } label: {
                    Rectangle()
                        .fill(Color.clear)
                        .overlay(
                            Image(systemName: "plus")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.white)
                        )
                }
                .frame(width: geometry.size.width / 2, height: geometry.size.height)
                .contentShape(Rectangle())
                .buttonRepeatBehavior(.enabled)
                .position(x: geometry.size.width * 3/4, y: geometry.size.height / 2)
                
                // Health display (non-interactive)
                Text("\(player.health)")
                    .font(.system(size: 45, weight: .black, design: .monospaced))
                    .fontWeight(.ultraLight)
                    .foregroundColor(flashColor)
                    .scaleEffect(isAnimating ? 1.1 : 1.0)
                    .animation(.easeInOut(duration: 0.2), value: isAnimating)
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.5)
                    .allowsHitTesting(false)
                
                // "dead?" button (interactive)
                if player.health <= 0 {
                    Button("dead?") {
                        player.isDead = true
                    }
                    .font(.system(size: 16, weight: .light, design: .monospaced))
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .padding(.horizontal, 20)
                    .padding(.vertical,4)
                    .background(Color.red.opacity(0.2))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.red, lineWidth: 2)
                    )
                    .position(x: geometry.size.width / 2, y: geometry.size.height)
                }
            }
        }
        .frame(height: 120) // Fixed height for consistent sizing
        .background(.black)
        .foregroundStyle(.white)
        .font(.title)
        .monospaced()
    }
    
    private func flashRed() {
        withAnimation(.easeInOut(duration: 0.1)) {
            flashColor = .red
            isAnimating = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.easeInOut(duration: 0.2)) {
                flashColor = .white
                isAnimating = false
            }
        }
    }
    
    private func flashGreen() {
        withAnimation(.easeInOut(duration: 0.1)) {
            flashColor = .green
            isAnimating = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.easeInOut(duration: 0.2)) {
                flashColor = .white
                isAnimating = false
            }
        }
    }
}


#Preview {
    HealthView(player: Player(name: "Joseph", health: 0, color: "Blue"))
        .previewLayout(.sizeThatFits)
}
