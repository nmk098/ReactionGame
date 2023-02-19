//
//  RandomCircleView.swift
//  Test
//
//  Created by Никита Курюмов on 11.02.23.
//

import SwiftUI

struct RandomCircleView: View {
    
    @Binding var radius: CGFloat
    @Binding var RandomColor: [Color]
   // @Binding var circleVisibility: Visibility
    
    var body: some View {
        Circle()
            .frame(width: radius)
            .foregroundColor(RandomColor.randomElement())
            .shadow(radius: 10)
            .overlay(Circle().stroke())
    }
}

//struct RandomCircleView_Previews: PreviewProvider {
//    static var previews: some View {
//        RandomCircleView(r)
//    }
//}
