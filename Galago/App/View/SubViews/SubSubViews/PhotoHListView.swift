//
//  PhotoHListView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-11-05.
//

import SwiftUI

struct PhotoHListView: View {
    
    @StateObject private var mediaLoader = MediaLoader()
    
    
    var body: some View {
        
        TabView {
            ForEach(mediaLoader.videoThumbnails, id: \.self) { item in
                Image(item)
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())
        .onAppear() {
            mediaLoader.setType(type: "videophoto")
            mediaLoader.loadMedia()
        }
    }
        
}

struct PhotoHListView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoHListView()
    }
}
