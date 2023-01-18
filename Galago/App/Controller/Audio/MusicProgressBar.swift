//
//  MusicProgressBar.swift
//  Galago
//
//  Created by Inhee Kim on 2022-08-19.
//

import Foundation
import SwiftUI

struct MusicProgressBar: View {
    
    @Binding var pre_progress: Double
    @Binding var progress: Double
    @State var duration: CGFloat
    @State var width: CGFloat = 200
    @State var height: CGFloat = 200
    @State var strokeThickness: CGFloat = 15
    @State var pre_progFillColor = Color.red
    @State var progFillColor = Color.white
    @State var progEmptyColor = Color.gray
    
    
    var body: some View {
        
        
        
        VStack {
            ZStack {
                Circle()
                    .stroke(progEmptyColor, lineWidth: strokeThickness)
                    .frame(width: width, height: height)
                Circle()
                    .trim(from: 0.0, to: progress / duration)
                    .stroke(progFillColor, lineWidth: strokeThickness)
                    .frame(width: width, height: height)
                    .rotationEffect(Angle(degrees: -90))
                
                if pre_progress > 0 {
                    
                    let from = 0.0 ///((pre_progress / duration) - (duration * 0.0002))
                    let to = (pre_progress / duration)
                    
                    Circle()
                        .trim(from: from, to: to)
                        .stroke(pre_progFillColor, lineWidth: strokeThickness)
                        .frame(width: width, height: height)
                        .rotationEffect(Angle(degrees: -90))
                        .opacity(0.7)
                }
                //Text("\(Int(self.progress))")
            }
        }
        
        
    }
}
struct MusicProgressBar_Preview: PreviewProvider {
    static var previews: some View {
        MusicProgressBar(pre_progress: .constant(1), progress: .constant(13), duration: 100)
    }
}
