//
//  RotatingAnimationView.swift
//  MetaEgg
//
//  Created by Ivan Shturkhal on 12.03.2026.
//

import SwiftUI

struct RotatingAnimationView: View {
    
    let imageName: String
    @State private var angle: Double = 0
    private let imageCount = 3
    private let radius: CGFloat = 30
    private let sizeRange: ClosedRange<CGFloat> = 10...18
    private let rotationSpeed = 0.01
    
    var body: some View {
        ZStack {
            ForEach(0..<imageCount, id: \.self) { index in
                let currentAngle = angle + Double(index) * (360.0 / Double(imageCount))
                let angleInRadians = Angle(degrees: currentAngle).radians
                let x = cos(angleInRadians) * radius
                let y = sin(angleInRadians) * radius
                let scale = 0.8 + 0.8 * CGFloat(sin(angleInRadians) + 1)
                let size = sizeRange.lowerBound + scale * (sizeRange.upperBound - sizeRange.lowerBound)
                let shadowScale = 0.9 + 0.2 * CGFloat(cos(angleInRadians) + 1)
                
                ZStack {
                    Ellipse()
                        .fill(Color.black)
                        .frame(width: size, height: size / 4)
                        .offset(x: x, y: y + 20)
                        .scaleEffect(shadowScale)
                    
                    Image(imageName)
                        .resizable()
                        .frame(width: size, height: size + 6)
                        .offset(x: x, y: y)
                }
            }
        }
        .frame(width: 160, height: 160)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: rotationSpeed, repeats: true) { _ in
                angle += 2
            }
        }
    }
}
