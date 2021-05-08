//
//  LearningMetal.swift
//  Project_9_Drawing
//
//  Created by Christopher Hicks on 5/8/21.
//

import SwiftUI

struct ColorChangingCircle: View {
    var amount = 10.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct LearningMetal: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        
        VStack {
            ColorChangingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
        }
           
       
    }
    
}

struct LearningMetal_Previews: PreviewProvider {
    static var previews: some View {
        LearningMetal()
    }
}
