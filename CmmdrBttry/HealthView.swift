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
        HStack(spacing: 55) {
            Group {
                Image(systemName: "minus")
            }
            .frame(width: 50, height: 50)
            .contentShape(Rectangle())
            .onTapGesture {
                player.health -= 1
            }
            
            Text("\(player.health)")
                .font(.system(size: 45, weight: .black, design: .monospaced))
                .fontWeight(.ultraLight)
            
            Group{
                Image(systemName: "plus")
            }
            .frame(width: 50, height: 50)
            .contentShape(Rectangle())
            .onTapGesture {
                player.health += 1
                animateHealthIncrease()
            }
        }
        .background(.black)
        .foregroundStyle(.white)
        .font(.title)
        .monospaced()
    }
    
    func animateHealthIncrease() {
        print("animate")
    }
}


#Preview {
    HealthView(player: Player(name: "Joseph", health: 40, color: "Blue"))
        .previewLayout(.sizeThatFits)
}
