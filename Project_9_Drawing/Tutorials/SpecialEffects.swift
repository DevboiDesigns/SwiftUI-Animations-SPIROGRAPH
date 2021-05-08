//
//  SpecialEffects.swift
//  Project_9_Drawing
//
//  Created by Christopher Hicks on 5/8/21.
//

import SwiftUI

struct SpecialEffects: View {
    @State private var amount: CGFloat = 0.0
    
    var body: some View {
        
        
        VStack {
            
            Spacer()
            
            VStack {
                Image("girl")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
                    .saturation(Double(amount))
                    .blur(radius: (1 - amount) * 20)
                
            }
            ZStack {
//                Circle()
//                    .fill(Color(red: 1, green: 0, blue: 0))
//                    .frame(width: 200 * amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(Color(red: 0, green: 1, blue: 0))
//                    .frame(width: 200 * amount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(Color(red: 0, green: 0, blue: 1))
//                    .frame(width: 200 * amount)
//                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        
        
        
//        ZStack {
//            Image("girl")
////                .resizable()
////                .scaledToFit()
//
//            Rectangle()
//                .fill(Color.purple)
//                .blendMode(.hardLight)
//
//        }
//        .frame(width: 400, height: 500)
//        .clipShape(RoundedRectangle(cornerRadius: 16))
//        .padding(40)
    }
}

struct SpecialEffects_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffects()
    }
}
