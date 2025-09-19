//
//  GameView.swift
//  CmmdrBttry
//
//  Created by Joseph Gilmore on 5/25/24.
//

import SwiftUI

struct GameView: View {
    var playerCount: Int
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background
                Color.black
                    .ignoresSafeArea()
                
                // Player layouts based on count
                switch playerCount {
                case 1:
                    // Single player - centered at bottom
                    singlePlayerLayout(geometry: geometry)
                case 2:
                    // Two players - both at bottom facing up
                    twoPlayerLayout(geometry: geometry)
                case 3:
                    // Three players - two at bottom, one at top
                    threePlayerLayout(geometry: geometry)
                case 4:
                    // Four players - two at bottom, two at top
                    fourPlayerLayout(geometry: geometry)
                default:
                    EmptyView()
                }
                
                // Quadrant borders
                quadrantBorders(geometry: geometry)
                
                // Center menu button
                menuButton
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            // Keep screen awake during gameplay
            UIApplication.shared.isIdleTimerDisabled = true
        }
        .onDisappear {
            // Re-enable auto-lock when leaving game
            UIApplication.shared.isIdleTimerDisabled = false
        }
    }
    
    // MARK: - Layout Functions
    
    private func singlePlayerLayout(geometry: GeometryProxy) -> some View {
        // Single player at bottom center - full width
        HealthView(player: Player.testExample())
            .frame(width: geometry.size.width, height: geometry.size.height / 2)
            .position(x: geometry.size.width / 2, y: geometry.size.height * 0.75)
    }
    
    private func twoPlayerLayout(geometry: GeometryProxy) -> some View {
        ZStack {
            // Player 1 - Bottom left quadrant
            HealthView(player: Player.testExample())
                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                .position(x: geometry.size.width * 0.25, y: geometry.size.height * 0.75)
            
            // Player 2 - Bottom right quadrant
            HealthView(player: Player.testExample())
                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                .position(x: geometry.size.width * 0.75, y: geometry.size.height * 0.75)
        }
    }
    
    private func threePlayerLayout(geometry: GeometryProxy) -> some View {
        ZStack {
            // Player 1 - Bottom left quadrant
            HealthView(player: Player.testExample())
                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                .position(x: geometry.size.width * 0.25, y: geometry.size.height * 0.75)
            
            // Player 2 - Bottom right quadrant
            HealthView(player: Player.testExample())
                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                .position(x: geometry.size.width * 0.75, y: geometry.size.height * 0.75)
            
            // Player 3 - Top center (facing down) - full width
            HealthView(player: Player.testExample())
                .rotationEffect(.degrees(180))
                .frame(width: geometry.size.width, height: geometry.size.height / 2)
                .position(x: geometry.size.width / 2, y: geometry.size.height * 0.25)
        }
    }
    
    private func fourPlayerLayout(geometry: GeometryProxy) -> some View {
        ZStack {
            // Bottom players (facing up)
            // Player 1 - Bottom left quadrant
            HealthView(player: Player.testExample())
                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                .position(x: geometry.size.width * 0.25, y: geometry.size.height * 0.75)
            
            // Player 2 - Bottom right quadrant
            HealthView(player: Player.testExample())
                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                .position(x: geometry.size.width * 0.75, y: geometry.size.height * 0.75)
            
            // Top players (facing down - rotated 180°)
            // Player 3 - Top left quadrant
            HealthView(player: Player.testExample())
                .rotationEffect(.degrees(180))
                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                .position(x: geometry.size.width * 0.25, y: geometry.size.height * 0.25)
            
            // Player 4 - Top right quadrant
            HealthView(player: Player.testExample())
                .rotationEffect(.degrees(180))
                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                .position(x: geometry.size.width * 0.75, y: geometry.size.height * 0.25)
        }
    }
    
    // MARK: - Quadrant Borders
    
    private func quadrantBorders(geometry: GeometryProxy) -> some View {
        ZStack {
            // Vertical center line
            Rectangle()
                .fill(Color.white.opacity(0.3))
                .frame(width: 1, height: geometry.size.height)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            
            // Horizontal center line
            Rectangle()
                .fill(Color.white.opacity(0.3))
                .frame(width: geometry.size.width, height: 1)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
    }
    
    // MARK: - Menu Button
    
    private var menuButton: some View {
        NavigationLink {
            MenuView()
        } label: {
            ZStack {
                Circle()
                    .fill(Color.black)
                    .frame(width: 80, height: 80)
                
//                Circle()
//                    .stroke(Color.white, lineWidth: 2)
//                    .frame(width: 80, height: 80)
                
                Image(systemName: "gearshape")
                    .font(.system(size: 60
                                  , weight: .ultraLight, design: .default))
                    .foregroundColor(.white.opacity(0.5))
            }
        }
    }
}
#Preview {
    GameView(playerCount: 4)
        .previewLayout(.sizeThatFits)
}
