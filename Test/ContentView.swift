//
//  ContentView.swift
//  Test
//
//  Created by Никита Курюмов on 11.02.23.
//

import SwiftUI



struct ContentView: View {
    
   @State var buttonText: String = "Start"
    
    @State var strongLevel: String = "LEVEL"
    @State var levelImage: String = ""
    
    @State var greenTapCount: Int = 0
    @State var redTapCount: Int = 0
    
    @State var sliderValue: Double = 1
    @State var speed: Double = 1
    @State var isShowing: Bool = true
    
    var timer = Timer.publish(every: TimeInterval(showSpeed), on: .main, in: .common)
    
    @State var avaString: String = ""
    
    let screenHeight = UIScreen.main.bounds.size.height
    let screenWidth = UIScreen.main.bounds.size.width
    
    @State var randomX = CGFloat.random(in: 100...300)
    @State var randomY = CGFloat.random(in: 100...900)
    @State private var radius: CGFloat = 50
    @State private var RandomColor: [Color] = [
        .red, .blue, .green, .yellow
    ]
    @State var circleVisibility: Double = 0
    @State var sliderVisibility: Double = 1
    
    var body: some View {
        ZStack{
            RadialGradient(
                gradient: Gradient(colors: [
                    Color.white, Color("BackGround")
                ]),
                         center: .center,
                         startRadius: 0,
                         endRadius: 500
            )
            .ignoresSafeArea()
            .onTapGesture {
                redTapCount += 1
            }
            
            RandomCircleView(radius: $radius, RandomColor: $RandomColor)
                .opacity(circleVisibility)
                .position(x: randomX,
                          y: randomY)
                .onTapGesture {
                    randomX = CGFloat.random(in: 80...350)
                        randomY = CGFloat.random(in: 100...800)
                    greenTapCount += 1
                                    }
    
            VStack{
                
                HStack() {
                    Button(action: {
                        isShowing.toggle()
                        sliderVisibility = 1
                        circleVisibility = 0
                        buttonText = "Start"
                        greenTapCount = 0
                        redTapCount = 0
                    }) {
                        Text("stop")
                            .font(.title)
                            .fontWeight(.medium)
                            .tint(Color(.purple))
                            .opacity(circleVisibility)
                        
                    }
                    .padding()
                    Spacer()
                    
                    HStack{
                        Text("\(redTapCount)")
                            .font(.title)
                            .fontWeight(.medium)
                            .tint(Color("redTap"))
                            .frame(width: 50,
                            height: 40)
                            .background(Color("redTap"))
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1))
                            .opacity(circleVisibility)
                        
                    Text("\(greenTapCount)")
                            .tint(Color("greenTap"))
                        .font(.title)
                        .fontWeight(.medium)
                        .frame(width: 50,
                        height: 40)
                        .background(Color("greenTap"))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1))
                        .opacity(circleVisibility)
                }
                    .padding()
                }
                .padding(.top)
                Spacer()
                ModalView(
                          isShowing: $isShowing,
                          strongLevel: $strongLevel,
                          sliderValue: $sliderValue,
                          levelImage: $levelImage,
                          speed: $speed,
                          buttonText: $buttonText,
                          circleVisibility: $circleVisibility,
                          sliderVisibility: $sliderVisibility,
                          randomX: $randomX,
                          randomY: $randomY
                )
            }
            .ignoresSafeArea()
            Spacer()
        }
    }
           
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

extension UIScreen {
  static let screenHeight = UIScreen.main.bounds.size.height
   static let screenWidth = UIScreen.main.bounds.size.width
}

