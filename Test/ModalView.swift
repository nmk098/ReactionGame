//
//  ModalView.swift
//  Test
//
//  Created by Никита Курюмов on 18.02.23.
//

import SwiftUI

struct ModalView: View {
    
    @Binding var isShowing: Bool
    @State var currentHeight: Double = 400
    @State var radius: CGFloat = 100
    
    @Binding var strongLevel: String
    @Binding var sliderValue: Double
    @Binding var levelImage: String
    
    @Binding var speed: Double
    
    @Binding var buttonText: String
    @Binding var circleVisibility: Double
    @Binding var sliderVisibility: Double
    @Binding var randomX: CGFloat
    @Binding var randomY: CGFloat
    @Binding var fieldOpacity: Double
    
    let minHeight = 400
    let maxHeight = 700
    
    var body: some View {
        if isShowing {
            ZStack{
                Color(.black)
                    .opacity(0.3)
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Text(strongLevel)
                        Image(systemName: levelImage)
                    }
                    VStack{   Text("Speed:")
                            .font(.largeTitle)
                        Text(
                            String(format: "%.0f", sliderValue)
                        )
                        .font(.title)
                    }
                    .fixedSize()
                    
                    SliderView(
                        strongLevel: $strongLevel,
                        sliderValue: $sliderValue,
                        levelImage: $levelImage,
                        speed: $speed
                    )
                    .padding(.horizontal, 40)
                    .opacity(sliderVisibility)
                    
                    ButtonView(
                        buttonText: $buttonText,
                        circleVisibility: $circleVisibility,
                        sliderVisibility: $sliderVisibility,
                        randomX: $randomX,
                        randomY: $randomY,
                        isShowing: $isShowing,
                        fieldOpacity: $fieldOpacity,
                        sliderValue: $sliderValue,
                        speed: $speed
                    )
                }
            }
            .frame(height: 400)
            .background(Color("BackGround"))
            .cornerRadius(30)
            .overlay(RoundedRectangle(cornerRadius: 30).stroke(lineWidth: 4))
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .bottom
            )
            .ignoresSafeArea()
            .transition(.move(edge: .bottom))
            .animation(.easeInOut(duration: 0.3))
        }
        
        
    }
    
    
    struct ModalView_Previews: PreviewProvider {
        static var previews: some View {
            ModalView(isShowing: .constant(true), strongLevel: .constant("Level"), sliderValue: .constant(1), levelImage: .constant("heart"), speed: .constant(1), buttonText: .constant("Start"), circleVisibility: .constant(1), sliderVisibility: .constant(1), randomX: .constant(200), randomY: .constant(100), fieldOpacity: .constant(1) )
        }
    }
}
