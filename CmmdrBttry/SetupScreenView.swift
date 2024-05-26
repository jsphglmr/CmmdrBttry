//
//  SetupScreenView.swift
//  CmmdrBttry
//
//  Created by Joseph Gilmore on 5/25/24.
//

import SwiftUI

struct SetupScreenView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("How many players?")
                    .foregroundColor(.white)
                HStack(alignment: .center, spacing: 10) {
                    
                    ForEach(1..<5) { playerCount in
                        NavigationLink {
                            GameView(playerCount: playerCount)
                        } label: {
                            Text("\(playerCount)")
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                            
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
        }
    }
}

#Preview {
    SetupScreenView()
}
