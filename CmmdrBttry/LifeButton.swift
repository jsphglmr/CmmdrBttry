//
//  LifeButton.swift
//  CmmdrBttry
//
//  Created by Joseph Gilmore on 5/23/25.
//

import SwiftUI

struct LifeButton: View {
    let value: Int
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(value > 0 ? "+\(value)" : "\(value)")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 50, height: 40)
                .background(color)
                .cornerRadius(8)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
