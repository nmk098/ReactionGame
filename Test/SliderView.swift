//
//  SliderView.swift
//  Test
//
//  Created by Никита Курюмов on 12.02.23.
//

import SwiftUI

struct SliderView: View {
    @Binding var strongLevel: String
    @Binding var sliderValue: Double
    @Binding var levelImage: String
    @Binding var radius: CGFloat
    
    @Binding var speed: TimeInterval
    
    var body: some View {
        Slider(
            value: $sliderValue,
            in: 1...10,
            onEditingChanged: { _ in
                speed = sliderValue
                if sliderValue <= 2 {
                    strongLevel = "BABY"
                    levelImage = "figure.and.child.holdinghands"
                    speed = 2
                    radius = 200
                } else if  sliderValue > 2 && sliderValue <= 4 {
                    strongLevel = "YOUNG MAN"
                    levelImage = "person.fill"
                    speed = 1.5
                    radius = 150
                }else if  sliderValue >= 5 && sliderValue <= 6 {
                    strongLevel = "STRONG!"
                    levelImage = "figure.strengthtraining.traditional"
                    speed = 1.0
                    radius = 100
                }else if  sliderValue >= 7 && sliderValue <= 8 {
                    strongLevel = "FLASH"
                    levelImage = "bolt.fill"
                    speed = 0.7
                    radius = 75
                }else if  sliderValue >= 9 && sliderValue <= 10 {
                    strongLevel = "WHO ARE YOU?!"
                    levelImage = "questionmark.app"
                    speed = 0.4
                    radius = 50
                }
            }
        )
                .accentColor(.blue)
        .padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(strongLevel: .constant("norm"), sliderValue: .constant(1), levelImage: .constant("heart"), radius: .constant(50), speed: .constant(1))
    }
}
