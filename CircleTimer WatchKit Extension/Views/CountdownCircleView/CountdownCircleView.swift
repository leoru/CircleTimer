//
//  CountdownCircleView.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import SwiftUI

struct CountdownCircleView: View {
    
    struct Metrics {
        static let backViewOpacity = 0.4
        static let lineWidth = 5.0
        static let backgroundColor = Color.white
        static let foregroundColor = Color.orange
    }
    
    @Binding var progress: Float
    @Binding var timeLabel: String
    
    var body: some View {
        ZStack {
            backgroundCircle
            foregroundCircle
            countdownTimeLabel
        }
    }
    
    var backgroundCircle: some View {
        Circle()
            .stroke(lineWidth: Metrics.lineWidth)
            .opacity(Metrics.backViewOpacity)
            .foregroundColor(Metrics.backgroundColor)
    }
    
    var foregroundCircle: some View {
        Circle()
            .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
            .stroke(style: StrokeStyle(lineWidth: Metrics.lineWidth, lineCap: .round, lineJoin: .round))
            .foregroundColor(Metrics.foregroundColor)
            .rotationEffect(Angle(degrees: 270.0))
    }
    
    var countdownTimeLabel: some View {
        Text(timeLabel).foregroundColor(.white)
            .font(Font.system(size: 30.0))
    }
    
}
