//
//  CreativeBorders.swift
//  Project_9_Drawing
//
//  Created by Christopher Hicks on 5/8/21.
//

import SwiftUI

struct CreativeBorders: View {
    
    @State private var colorChange = false
    
    var body: some View {
        
        VStack {
            withAnimation {
                Text("Devboi Designs")
                    .frame(width: 300, height: 300)
                    .background(colorChange ? Color.white : Color.black)
                    .foregroundColor(colorChange ? Color.white : Color.black)
                    .shadow(color: .black, radius: 1, x: 0.0, y: 0.0)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                    .onAppear(perform: {
                        colorChange.toggle()
                    })
                    .border(ImagePaint(image: Image("spiral"),sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
            }
            
            Capsule()
                .strokeBorder(ImagePaint(image: Image("spiral"), scale: 0.1), lineWidth: 20)
                .frame(width: 300, height: 200)
                
        }
        
    }
}

struct CreativeBorders_Previews: PreviewProvider {
    static var previews: some View {
        CreativeBorders()
    }
}
