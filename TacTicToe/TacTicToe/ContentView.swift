//
//  ContentView.swift
//  TacTicToe
//
//  Created by P.M. Student on 1/26/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            Home()
                .navigationTitle("Tac Tic Toe")
            
        }
       
    }
}

struct Home : View {
    
    // For the number of moves
    @State var moves : [String] = Array (repeating: "", count: 9)
    // Identifies the current player
    @State var isPlaying = true
    
    var body: some View {
        VStack {
            
            LazyVGrid(columns: Array(repeating:GridItem(.flexible(), spacing:15), count:3), spacing: 15) {
                
                ForEach(0..<9, id: \.self)
                { index in
                    ZStack {
                        
                        
                        Color.red
                        
                        Color.blue
                            .opacity(moves[index] ==  "" ? 1 : 0)
                        
                        Text(moves[index])
                            .font(.system(size: 55))
                            .fontWeight(.heavy)
                            .foregroundColor(.orange)
                            
                    }
                    
                    
                    .frame(width: getWidth(),height: getWidth())
                    .cornerRadius(15)
                    .onTapGesture(perform: {
                        withAnimation(Animation.easeIn(duration:0.5)) {
                            
                            if moves[index] == "" {
                            moves[index] = isPlaying ? "X" : "O"
                            isPlaying.toggle()
                        }
                        }
                        })
                }
                
            }
            
            .padding()
        }
        
    }
    
    // Used to calculate width.
    
    func getWidth() -> CGFloat {
        let width = UIScreen.main.bounds.width - (30 + 30)
        
        return width / 3
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
}
