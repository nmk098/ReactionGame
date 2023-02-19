//
//  ButtonView.swift
//  Test
//
//  Created by Никита Курюмов on 13.02.23.
//

import SwiftUI

struct ButtonView: View {
    
    @Binding var buttonText: String
    @Binding var circleVisibility: Double
    @Binding var sliderVisibility: Double
    @Binding var randomX: CGFloat
    @Binding var randomY: CGFloat
    @Binding var isShowing: Bool
    var body: some View {
        Button(action: { startGame() }) {
            Text(buttonText)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(.black)
                .frame(width: 100,
                height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1.5))
                .shadow(radius: 5)
                
        }
    }
    func startGame() {
            circleVisibility = 1
            sliderVisibility = 0
            buttonText = "Stop"
            isShowing.toggle()
        
        randomX = CGFloat.random(in: 50...350)
        randomY = CGFloat.random(in: 50...350)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: .constant("Start"), circleVisibility: .constant(1), sliderVisibility: .constant(1), randomX: .constant(200), randomY: .constant(234), isShowing: .constant(true))
    }
}
