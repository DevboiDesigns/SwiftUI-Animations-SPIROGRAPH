//
//  ShapesAndBorders.swift
//  Project_9_Drawing
//
//  Created by Christopher Hicks on 5/8/21.
//

import SwiftUI


// ARC
struct Arc2: InsettableShape {   // will allow you to use stroke border on Arc
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}


struct ShapesAndBorders: View {
    var body: some View {
        
        
        VStack {
            
            Arc2(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
                .strokeBorder(Color.black, lineWidth:4)
            
            Circle()
                .strokeBorder(Color.black, lineWidth: 40)
        }
            
    }
}

struct ShapesAndBorders_Previews: PreviewProvider {
    static var previews: some View {
        ShapesAndBorders()
    }
}
