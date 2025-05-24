//
//  CommanderDamageButtonStyle.swift
//  CmmdrBttry
//
//  Created by Joseph Gilmore on 5/23/25.
//

import SwiftUI

struct CommanderDamageButtonStyle: ButtonStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 35, height: 35)
            .background(color.opacity(configuration.isPressed ? 0.7 : 1.0))
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
