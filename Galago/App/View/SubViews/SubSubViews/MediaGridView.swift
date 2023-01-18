//
//  MediaGridView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-10-09.
//

import SwiftUI


// -- to optimize array quantity.
class MediaLoader : ObservableObject {
    
    
    init() { }
    
    var videoType = "Movie_Thumbnail"
    @Published var layout = [GridItem]()
    @Published var videoThumbnails = Array(1...1).map({ "Movie_Thumbnail \($0)" })
    
    func loadMedia() {
        
        // -- search and check thumbnails
        for i in 1...9999 {
            
            if(UIImage(named: "\(videoType) \(i)") == nil)
            {
                videoThumbnails = Array(1...(i - 1)).map({ "\(videoType) \($0)" })
                break; //-- stops if no more thumbnails
            }
            
        }
    }
    
    func setColumns(count: Int) {
        // ------------------------------------------------------
        // --- This function is to create columns accordingly.---
        // ------------------------------------------------------
        layout = [GridItem]()
        
        for _ in 1...count {
            layout.append(GridItem(.flexible(minimum: 1)))
        }
    }
    
    func setType(type: String)
    {
        if type.lowercased() == "movie" {
            self.videoType = "Movie_Thumbnail"
        } else if type.lowercased() == "tvshow" {
            self.videoType = "TVShow_Thumbnail"
        } else if type.lowercased() == "videophoto" {
            self.videoType = "Video_Photo"
        }
    }
}


struct MediaGridView: View {
    
    @EnvironmentObject var popupManager: PopupManager
    @EnvironmentObject var apiService: APIService
    
    @State var videoType: String
    @State var columns: CGFloat
    @StateObject private var mediaLoader = MediaLoader()
    
    @Binding var popover_index: String
    
    var body: some View {
        
        ScrollView(.vertical) {
            LazyVGrid(columns: mediaLoader.layout, content: {
                
      
                ForEach(mediaLoader.videoThumbnails, id: \.self) { item in
                    
                    VideoCard(filename: item, column_count: columns)
                        .padding()
                        .onTapGesture {
                            withAnimation() {
                                self.popover_index = item
                                popupManager.showVideoInfoPopup()
                                
                            }
                        }
                }
            })
        }
        .onAppear() { // -- Optimizating "videos" array by this call.
            mediaLoader.setColumns(count: Int(columns))
            mediaLoader.setType(type: self.videoType)
            mediaLoader.loadMedia() // -- Async
            
            Task {
                await apiService.LoadMedia(entity: "videoentity") { response in
                    
                }
            }
        }
    }
}

struct MediaGridView_Previews: PreviewProvider {
    static var previews: some View {
        MediaGridView(videoType: "movie", columns: 2, popover_index: .constant(""))
            .environmentObject(APIService())
    }
}
