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
    @Binding var fieldOpacity: Double
    @Binding var sliderValue: Double
    @Binding var speed: Double
    
    var body: some View {
        Button(action: { startGame() }) {
            Text(buttonText)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(.white)
                .frame(width: 100,
                height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1.5))
                .shadow(radius: 5)
                
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: .constant("Start"), circleVisibility: .constant(1), sliderVisibility: .constant(1), randomX: .constant(200), randomY: .constant(234), isShowing: .constant(true), fieldOpacity: .constant(1), sliderValue: .constant(1), speed: .constant(1))
    }
}

extension ButtonView {
    func startGame() {
            circleVisibility = 1
            sliderVisibility = 0
            buttonText = "Stop"
            isShowing.toggle()
            fieldOpacity = 1
        
        randomX = CGFloat.random(in: 50...350)
        randomY = CGFloat.random(in: 50...350)
        
//        if sliderValue <= 2 {
//            speed = 2.0
//        } else if  sliderValue > 2 && sliderValue <= 4 {
//            speed = 1.5
//        } else if  sliderValue > 4 && sliderValue <= 6 {
//            speed = 1.2
//        } else if  sliderValue > 6 && sliderValue <= 8 {
//            speed = 1.0
//        } else if  sliderValue > 8 && sliderValue <= 10 {
//            speed = 0.8
//        }
    }
}
