//
//  HealthView.swift
//  CmmdrBttry
//
//  Created by Joseph Gilmore on 5/25/24.
//

import SwiftUI

struct HealthView: View {
    var player: Player
    var body: some View {
        HStack(spacing: 35) {
            Group {
                Image(systemName: "minus")
            }
            .contentShape(Rectangle())
            .onTapGesture {
                player.health -= 1
            }
            
            Text("\(player.health)")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Group{
                Image(systemName: "plus")
            }
            .contentShape(Rectangle())
            .onTapGesture {
                player.health += 1
            }
        }
        .background(.black)
        .foregroundStyle(.white)
        .font(.title)
        .monospaced()
        
        
    }
}

#Preview {
    HealthView(player: Player(name: "Joseph", health: 40, color: "Blue"))
        .previewLayout(.sizeThatFits)
}
