//
//  PlaybackControlButton.swift
//  Galago
//
//  Created by Inhee Kim on 2022-07-30.
//

import SwiftUI

struct PlaybackControlButton: View {
    var systemName: String = "play"
    var fontSize: CGFloat = 24
    var color: Color = .black
    var action: () -> Void
    //var dragOnChange: () -> Void
    
    var body: some View {
        
        Image(systemName: systemName)
            .font(.system(size: fontSize))
            .foregroundColor(color)
            .onTapGesture {
                withAnimation() {
                    action()
                }
            }
    }
}

struct PlaybackControlButton_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackControlButton(action: {})
    }
}
