//
//  PromptSlice.swift
//  PhotoFinish
//
//  Created by Saoud Almulla on 5/31/20.
//  Copyright © 2020 Sleepy Studios. All rights reserved.
//

import SwiftUI

struct PromptSlice: View {
    var prompts: Double
    var color: Color
    var angleWidth: Double {
        return 360.0/prompts
    }
    
    var body: some View {
        PieSlice(angle: angleWidth, color: color)
    }
}

struct PieSlice: View {
    var angle: Double
    var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.9
                let xOffset = (width * (1.0 - xScale)) / 2.0
                
                path.move(
                    to: CGPoint(
                        x: width/2 + 2.5,
                        y: height/2 + 2.5
                    )
                )
                path.addArc(
                    center: CGPoint(x: width/2, y:height/2),
                    radius: width/2 - xOffset,
                    startAngle: .degrees(0 + 1),
                    endAngle: .degrees(self.angle - 1),
                    clockwise: false
                )
            }
            .fill(self.color)
            .aspectRatio(1, contentMode: .fit)
        }
    }
}

struct PromptSlice_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            PromptSlice(prompts: 5, color: Color.blue)
                .rotationEffect(.degrees(360/5 * 0))
        }
    }
}
