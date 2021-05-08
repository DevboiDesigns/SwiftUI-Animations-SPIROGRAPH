//
//  AnimatingShapes.swift
//  Project_9_Drawing
//
//  Created by Christopher Hicks on 5/8/21.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: CGFloat
    
    var animatableData: CGFloat {  // MAKES it Animatable
        get { insetAmount }
        set { self.insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct AnimatingShapes: View {
    @State private var insetAmount: CGFloat = 50
    @State private var animateInsetAmount = false
    
    var body: some View {
        ZStack {
            
            VStack {
                
                Trapezoid(insetAmount: animateInsetAmount ? -100 : 200)
                    .frame(width: 200, height: 100)
                    .onTapGesture {
                        withAnimation {
                        insetAmount = CGFloat.random(in: 10...90)
                        }
                    }
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                    .onAppear(perform: {
                        withAnimation {
                        insetAmount = CGFloat.random(in: -100...200)
                        }
                        animateInsetAmount.toggle()
                    })
            }
            Text("Devboi Designs")
                .font(.title)
                .foregroundColor(.white)
        }
    }
}

struct AnimatingShapes_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingShapes()
    }
}
