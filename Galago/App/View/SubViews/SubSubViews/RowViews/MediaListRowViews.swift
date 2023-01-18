//
//  MediaListRowViews.swift
//  Galago
//
//  Created by Inhee Kim on 2022-10-16.
//

import SwiftUI

struct MediaListRowViews: View {
    
    @State var id: CGFloat
    @State var img: String
    @State var desc1: String
    @State var desc2: String
    
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var popupManager: PopupManager
    
    
    var body: some View {
        
        Button(action: {
            withAnimation {
                popupManager.showAudioPopup()
            }
        }) {
            HStack {
                Image(img)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                    .cornerRadius(4)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(desc1)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    
                    Text(desc2)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct MediaListRowViews_Previews: PreviewProvider {
    static var previews: some View {
        MediaListRowViews(id: 1, img: "book", desc1: "Gangnamstyle", desc2: "PSY")
    }
}
