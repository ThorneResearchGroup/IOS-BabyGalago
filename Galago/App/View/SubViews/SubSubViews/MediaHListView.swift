//
//  MediaHorizontalView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-11-05.
//

import SwiftUI



struct MediaHListView: View {
    
    @EnvironmentObject var apiService: APIService
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var popupManager: PopupManager
    
    @StateObject private var mediaLoader = MediaLoader()
    
    @State var videoType: String
    
    @State private var scrollViewContentSize: CGSize = .zero // <-- Fetch the content size and resize the scrollview

    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack{
                ForEach(mediaLoader.videoThumbnails, id: \.self) { item in
                    
                    VideoCard(filename: item, column_count: 2)
                        .padding(10)
                        .onTapGesture {
                            withAnimation() {
                                popupManager.showVideoInfoPopup()
                                
                            }
                        }
                }
            }
            .background(
                GeometryReader { geo -> Color in
                    DispatchQueue.main.async {
                        scrollViewContentSize = geo.size
                    }
                    return Color.clear
                }
            )
        }
        .frame(
            maxWidth: scrollViewContentSize.width,
            maxHeight: scrollViewContentSize.height
        )
        .padding(10)
        .onAppear() {
            mediaLoader.setColumns(count: Int(1))
            mediaLoader.setType(type: self.videoType)
            mediaLoader.loadMedia() // -- Async
        }
        
    }
}

struct MediaHListView_Previews: PreviewProvider {
    static var previews: some View {
        MediaHListView(videoType: "")
            .environmentObject(APIService())
            .environmentObject(AudioManager())
            .environmentObject(PopupManager())
    }
}
