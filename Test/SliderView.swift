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
    
    @Binding var speed: Double
    
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
                    print(speed)
                } else if  sliderValue > 2 && sliderValue <= 4 {
                    strongLevel = "YOUNG MAN"
                    levelImage = "person.fill"
                    speed = 1.5
                    print(speed)
                }else if  sliderValue >= 5 && sliderValue <= 6 {
                    strongLevel = "STRONG!"
                    levelImage = "figure.strengthtraining.traditional"
                    speed = 1.3
                    print(speed)
                }else if  sliderValue >= 7 && sliderValue <= 8 {
                    strongLevel = "FLASH"
                    levelImage = "bolt.fill"
                    speed = 1.0
                    print(speed)
                }else if  sliderValue >= 9 && sliderValue <= 10 {
                    strongLevel = "WHO ARE YOU?!"
                    levelImage = "questionmark.app"
                    speed = 0.8
                    print(speed)
                }
            }
        )
                .accentColor(.blue)
        .padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(strongLevel: .constant("norm"), sliderValue: .constant(1), levelImage: .constant("heart"), speed: .constant(1))
    }
}
