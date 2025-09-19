//
//  SetupScreenView.swift
//  CmmdrBttry
//
//  Created by Joseph Gilmore on 5/25/24.
//

import SwiftUI

struct SetupScreenView: View {
    var body: some View {
        VStack {
            Text("How many players?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 50)
            
            HStack(alignment: .center, spacing: 20) {
                ForEach(1..<5) { playerCount in
                    NavigationLink(value: playerCount) {
                        VStack {
                            Text("\(playerCount)")
                                .font(.system(size: 60, weight: .bold, design: .rounded))
                                .foregroundColor(.black)
                            
                            Text(playerCount == 1 ? "Player" : "Players")
                                .font(.caption)
                                .foregroundColor(.black)
                        }
                        .frame(width: 120, height: 120)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
                    }
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

#Preview {
    SetupScreenView()
}
