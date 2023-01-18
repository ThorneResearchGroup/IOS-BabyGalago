//
//  VideoView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-04-23.
//

import SwiftUI



struct TVShowView: View {
    
    @State var text: String
    @State private var popover_index = ""
    
    
    var body: some View {
        
        VStack(spacing: 10.0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(MovieQuery.allCases, id: \.self) {
                        searchQuery in
                        QueryTag(query: searchQuery, isSelected: false)
                        
                    }
                    
                }
                .padding(.horizontal, 10)
            }
//            searchCategories() // -- Display Search Categories
            
            MediaGridView(videoType: "tvshow",
                          columns: 1,
                          popover_index: $popover_index)
        }
//        .onTapGesture{
//            withAnimation(.spring()){
//                self.showingPopover = false
//            }
//        }
//        .fullScreenCover(isPresented: $showingPopover)
//        {
//            VideoPopupView(isPresented: $showingPopover, file_index: popover_index, isVideo: true, videoFile: VideoFile.data)
//        }
        
    }
}

struct TVShowView_Previews: PreviewProvider {
    static var previews: some View {
        
        TVShowView(text: "")
            .environmentObject(PopupManager())
    }
}
