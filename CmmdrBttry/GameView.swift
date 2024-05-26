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
        VStack(spacing: 200) {
            if playerCount == 1 {
                HealthView(player: Player.testExample())
            } else if playerCount == 2 {
                VStack(spacing: 200) {
                    HealthView(player: Player.testExample())
                        .rotationEffect(.degrees(180))
                    HealthView(player: Player.testExample())
                }
            } else if playerCount == 3 {
                HStack(spacing: 200) {
                    HealthView(player: Player.testExample())
                        .rotationEffect(.degrees(90))

                    HealthView(player: Player.testExample())
                        .rotationEffect(.degrees(-90))
                }
                HealthView(player: Player.testExample())
            } else {
                HStack(spacing: 200) {
                    Group {
                        HealthView(player: Player.testExample())
                    }
                    .rotationEffect(.degrees(90))
                    Group {
                        HealthView(player: Player.testExample())
                    }
                    .rotationEffect(.degrees(-90))
                }
                HStack(spacing: 200) {
                    Group {
                        HealthView(player: Player.testExample())
                    }
                    .rotationEffect(.degrees(90))
                    Group {
                        HealthView(player: Player.testExample())
                    }
                    .rotationEffect(.degrees(-90))
                }
            }
        }
        .foregroundColor(.white)
        .overlay(alignment: .center) {
            // Menu Button
            Button {
                print("menu")
            } label: {
                Circle()
                    .stroke(.white, lineWidth: 2)
                    .frame(width: 100, height: 100)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    GameView(playerCount: 4)
        .previewLayout(.sizeThatFits)
}
