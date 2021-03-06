//
//  ContentView.swift
//  SlotMachine
//
//  Created by Aimeric on 2/28/20.
//  Copyright © 2020 Aimeric Tshibuaya. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [1,2,0]
    @State private var credits = 1000
    private var betAmount = 5
    
    
    var body: some View {
        
        ZStack{
            
        //bACKGROUND
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
                
                Rectangle()
                    .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
                VStack {
                        
                        Spacer()
                    
                        //Title
                        HStack{
                            Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            
                            Text("Casino Royale")
                            .bold()
                            .foregroundColor(.white)
                            
                             Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }.scaleEffect(2)
                    
                     Spacer()
                    
                    //Credits Counter
                    Text("Credits: " + String(credits))
                        .foregroundColor(.black)
                        .padding(.all,10)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20.0)
                    
                    Spacer()
                    
                    //Cards
                    HStack  {
                            
                        Image(symbols[numbers[0]])
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .background(Color.white.opacity(0.5))
                               // .cornerRadius(20.0)
                        
                            Image(symbols[numbers[1]])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                              //  .cornerRadius(20.0)
                            
                        Image(symbols[numbers[2]])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                               // .cornerRadius(20.0)
                        
                    }
                    
                    Spacer()
                    //Button
                    Button(action: {
                        
                        //change images
                        self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                        
                        self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                        
                        self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                        
                        //check winnings
                        if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                         
                            //Win
                            self.credits += self.betAmount * 10
                        }
                        else {
                            self.credits -= self.betAmount
                        }
                        
                    })  {
                        Text("Spin")
                        .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 30)
                            .background(Color.pink)
                            .cornerRadius(20)
                        
                        
                }
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
