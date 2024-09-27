//
//  ContentView.swift
//  DungeonDice
//
//  Created by TheForce on 9/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var resultMessage = ""
    //@State private var dragons = ["Vhagar", "Syrax", "Seasmoke", "Sunfyre", "Dreamfyre", "Vermax"]
    
    var body: some View {
        VStack {
            Text("Dungeon Dice")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.red)
            
            Spacer()
            
            Text(resultMessage)
                .font(.largeTitle)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .frame(height: 150)
            
            Spacer()
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 102))]) {
                ForEach(Dice.allCases, id: \.self) { dice in
                    Button("\(dice.rawValue)-sided") {
                        resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice."
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
            
            
    
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
