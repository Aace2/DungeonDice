//
//  ContentView.swift
//  DungeonDice
//
//  Created by TheForce on 9/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var resultMessage = ""
    @State private var buttonsLeftOver = 0 // # of buttons in a less than full row
    
    let horizontalPadding: CGFloat = 16
    let spacing: CGFloat = 0 // between buttons
    let buttonWidth: CGFloat = 102
    
    var body: some View {
        GeometryReader { geo in
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
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: buttonWidth), spacing: spacing)]) {
                    ForEach(Dice.allCases.dropLast(buttonsLeftOver), id: \.self) { dice in
                        Button("\(dice.rawValue)-sided") {
                            resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice."
                        }
                        .frame(width: buttonWidth)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
                HStack {
                    ForEach(Dice.allCases.suffix(buttonsLeftOver), id: \.self) { dice in
                        Button("\(dice.rawValue)-sided") {
                            resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice."
                        }
                        .frame(width: buttonWidth)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
            }
            .padding()
            .onChange(of: geo.size.width) {
                arrangeGridItems(geo: geo)
            }
            .onAppear() {
                arrangeGridItems(geo: geo)
            }
        }
    }
    func arrangeGridItems(geo: GeometryProxy) {
        var screenWidth = geo.size.width - horizontalPadding * 2 //padding on bothe sides
        if Dice.allCases.count > 1 {
            screenWidth += spacing
        }
        // calculate numOfButtonsPerRow as an Int
        let numbersOfButtonsPerRow = Int(screenWidth) / Int(buttonWidth + spacing)
        buttonsLeftOver = Dice.allCases.count % numbersOfButtonsPerRow
    }
}

#Preview {
    ContentView()
}
