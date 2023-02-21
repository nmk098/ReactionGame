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
            in: 0...5,
            step: 1,
            onEditingChanged: { _ in
                setSpeed()
            })
        
        .accentColor(.blue)
        .padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(strongLevel: .constant("norm"), sliderValue: .constant(1), levelImage: .constant("heart"), speed: .constant(1))
    }
}

extension SliderView {
    func setSpeed() {
        if sliderValue == 1 {
            strongLevel = "BABY"
            levelImage = "figure.and.child.holdinghands"
        } else if  sliderValue == 2 {
            strongLevel = "YOUNG MAN"
            levelImage = "person.fill"
        }else if  sliderValue == 3 {
            strongLevel = "STRONG!"
            levelImage = "figure.strengthtraining.traditional"
        }else if  sliderValue == 4 {
            strongLevel = "FLASH"
            levelImage = "bolt.fill"
        }else if  sliderValue == 5 {
            strongLevel = "WHO ARE YOU?!"
            levelImage = "questionmark.app"
        }
    }
}
