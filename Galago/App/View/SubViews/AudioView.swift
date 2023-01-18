//
//  AudioView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-07-30.
//

import SwiftUI

class ActiveAudioView : ObservableObject {
    
    // -- audios variable that contains thumbnail file names in array.
    @Published var audios = Array(1...1).map({ "Audio_cover \($0)" })
    func getAudios() {
        
        // -- search and check Audio humbnails
        for i in 1...9999 {
            
            
            
            if(UIImage(named: "Audio_cover \(i)") == nil)
            {
                audios = Array(1...(i - 1)).map({ "Audio_cover \($0)" })
                break; //-- stops if no more thumbnails
            }
            
            
        }
    }
}
struct AudioView: View {
    
    @StateObject private var activeAudios = ActiveAudioView()
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var popupManager: PopupManager
    
    let layout = [
        GridItem(.flexible(minimum: 2)),
        GridItem(.flexible(minimum: 2))
    ]
    @State var text: String

    var body: some View {
        
        VStack(spacing: 10.0) {
            
            
            MediaListView(type: "Audio")
//            ScrollView(.vertical) {
//                LazyVGrid(columns: layout, content: {
//
//
//                    ForEach(activeAudios.audios, id: \.self) { item in
//
//
//                        Button(action: {
//                            withAnimation {
//                                audioManager.audioPopover_index = item
//                                audioManager.audioPopover = true
//                            }
//                        })
//                        {
//                            Image(item)
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 100, height: 100, alignment: .center)
//                                .clipped()
//                                .border(Color.secondary, width: 0.3)
//                                .padding(12)
//                        }
//                    }
//                })
//            }
//            .onAppear() { // -- Optimizating "videos" array by this call.
//                 activeAudios.getAudios() // -- Async
//
//            }
        }

    }
}

struct AudioView_Previews: PreviewProvider {
    static var previews: some View {
        AudioView(text: "")
            .environmentObject(AudioManager())
            .environmentObject(PopupManager())
    }
}
