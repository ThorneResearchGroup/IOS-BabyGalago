//
//  VideoView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-04-23.
//

import SwiftUI


struct MovieView: View {
    
    
    @State var text: String
    @State private var popover_index = ""
    @EnvironmentObject var popupManager: PopupManager
    
    var body: some View {
        
        ZStack {
            ZStack(alignment: .bottomTrailing) {
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
                    
                    MediaGridView(videoType: "movie",
                                  columns: 2,
                                  popover_index: $popover_index)
                    
                    
                }
                //                .onTapGesture{
                //                    withAnimation(){
                //                        self.showingPopover = false
                //                    }
                //                }
                
            }
            .zIndex(0)
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        
        MovieView(text: "")
            .environmentObject(PopupManager())
    }
}
