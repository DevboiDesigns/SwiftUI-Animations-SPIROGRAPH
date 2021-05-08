//
//  ShapesWithPath.swift
//  Project_9_Drawing
//
//  Created by Christopher Hicks on 5/8/21.
//

import SwiftUI

struct DrawingWithPath: View {
    var body: some View {
        
        
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
//            path.addLine(to: CGPoint(x: 100, y: 300)) to fix bug in UI to make lines perfect
        }
        .stroke(Color.black, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//        .stroke(Color.purple.opacity(0.25), lineWidth: 4)
//        .fill(Color.purple)
        
    }
}

struct ShapesWithPath_Previews: PreviewProvider {
    static var previews: some View {
        DrawingWithPath()
    }
}
