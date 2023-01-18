//
//  MediaListView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-10-11.
//

import SwiftUI

struct MediaListView: View {
    
    @State var type: String
    
    var body: some View {
        
        let audioVM = AudioViewModel(audio: audioFile.data)
        
        ScrollView(.vertical) {
            MediaListRowViews(id: 1, img: "Audio_cover 1", desc1: audioVM.audio.title, desc2: audioVM.audio.description)
        }
        
    }
}

struct MediaListView_Previews: PreviewProvider {
    static var previews: some View {
        MediaListView(type: "Audio")
            .environmentObject(AudioManager())
    }
}
