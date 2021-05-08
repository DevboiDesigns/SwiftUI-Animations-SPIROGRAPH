//
//  TransformingShapes.swift
//  Project_9_Drawing
//
//  Created by Christopher Hicks on 5/8/21.
//

import SwiftUI

struct Flower: Shape {
    var petalOffest: Double = -20
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffest), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
        }
        return path
    }
}

struct TransformingShapes: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        
        VStack {
            Flower(petalOffest: petalOffset, petalWidth: petalWidth)
                .fill(Color.purple, style: FillStyle(eoFill: true))
                .padding()
            
            VStack(alignment: .leading) {
                Text("Offset")
                    .font(.caption)
                Slider(value: $petalOffset, in: -40...40)
                    .padding([.horizontal, .bottom])
                
                Text("Width")
                    .font(.caption)
                Slider(value: $petalWidth, in: 0...100)
                    .padding([.horizontal, .bottom])
            }
        }
    }
}

struct TransformingShapes_Previews: PreviewProvider {
    static var previews: some View {
        TransformingShapes()
    }
}
