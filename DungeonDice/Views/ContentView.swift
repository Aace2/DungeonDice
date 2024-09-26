//
//  ContentView.swift
//  DungeonDice
//
//  Created by TheForce on 9/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var resultMessage = ""
    
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
            
            Group {
                HStack {
                    Button("\(Dice.four.rawValue)-sided") {
                        resultMessage = "You rolled a \(Dice.four.roll()) on a \(Dice.four.rawValue)-sided dice."
                    }
                    Spacer()
                    Button("\(Dice.six.rawValue)-sided") {
                        resultMessage = "You rolled a \(Dice.six.roll()) on a \(Dice.six.rawValue)-sided dice."
                    }
                    Spacer()
                    Button("\(Dice.eight.rawValue)-sided") {
                        resultMessage = "You rolled a \(Dice.eight.roll()) on a \(Dice.eight.rawValue)-sided dice."
                    }
                }
                
                HStack {
                    Button("\(Dice.ten.rawValue)-sided") {
                        resultMessage = "You rolled a \(Dice.ten.roll()) on a \(Dice.ten.rawValue)-sided dice."
                    }
                    Spacer()
                    Button("\(Dice.twelve.rawValue)-sided") {
                        resultMessage = "You rolled a \(Dice.twelve.roll()) on a \(Dice.twelve.rawValue)-sided dice."
                    }
                    Spacer()
                    Button("\(Dice.twenty.rawValue)-sided") {
                        resultMessage = "You rolled a \(Dice.twenty.roll()) on a \(Dice.twenty.rawValue)-sided dice."
                    }
                }
                Button("\(Dice.hundred.rawValue)-sided") {
                    resultMessage = "You rolled a \(Dice.hundred.roll()) on a \(Dice.hundred.rawValue)-sided dice."
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
