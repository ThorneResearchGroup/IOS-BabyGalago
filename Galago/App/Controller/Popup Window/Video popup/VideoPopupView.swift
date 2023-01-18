//
//  VideoPopupView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-05-14.
//
// Source code from : https://blog.artemnovichkov.com/custom-popups-in-swiftui
//

import AVKit
import SwiftUI

struct VideoPopupView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var isPresented: Bool
    
    @State var file_index = "" // -- Later, hash/unique code will be saved here
    
    @State var isVideo: Bool
    
    
    @State private var player = AVPlayer()
    @State var videoFile: VideoFile?
    
    
    var body: some View {
        
        ZStack(alignment: .top){
            
            
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16) {
                    
                    VStack(alignment: .leading) {
                        Button( action: {
                            isPresented = false
                        }, label: {
                            Image(systemName: "xmark")
                                .imageScale(.small)
                                .frame(width: 32, height: 32)
                                .background(Color.black.opacity(0.5))
                                .cornerRadius(16)
                                .foregroundColor(.white)
                        })
                        
                        Spacer()
                    }
                    if(isVideo){
                        
                        VideoPlayer(player: $player)
                            .frame(width: .infinity, height: 300, alignment: .center)
                            .onAppear() {
                                
                            }
                        
                        Spacer()
                    }
                    
                    else {
                        
                        Image(file_index)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: .infinity, height: 300, alignment: .center)
                            .clipped()
                            .background(Color.black)
                            .padding(12)
                        
                    }
                    
                    ScrollView(.horizontal,
                        showsIndicators: false) {
                        HStack(spacing: 8.0) {
                            Image(file_index)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:60, height: 60)
                                .background(Color.black)
                            Image("")
                                .frame(width:60, height: 60)
                                .background(Color.gray)
                            Image("")
                                .frame(width:60, height: 60)
                                .background(Color.black)
                            Image("")
                                .frame(width:60, height: 60)
                                .background(Color.gray)
                            Image("")
                                .frame(width:60, height: 60)
                                .background(Color.black)
                            Image("")
                                .frame(width:60, height: 60)
                                .background(Color.red)
                            
                        }
                        .padding(.horizontal, 12)
                        .frame(width: .infinity, height: .infinity)
                    }
                        .offset(y: -15)
                    
                    HStack {
                        // -- Video Title
                        Text(file_index)
                            .font(.system(size: 40, weight: .bold, design: .default))
                        Spacer()
                    }
                    
                    HStack{
                        Text("Description")
                            .font(.system(size: 20, weight: .medium, design: .default))
                            .padding(.horizontal, 15)
                    }
                    .padding(.vertical, 30)
                    
                    HStack{
                        
                    }
                    .padding(.vertical, 500)
                }
                .padding()
            }
            .background(Color("Popups"))
            
            
        }
    }
}

struct VideoPopupView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPopupView(isPresented: .constant(true), isVideo: true, videoFile: VideoFile.data)
            .previewLayout(.sizeThatFits)
    }
}

struct VideoPlayer: UIViewControllerRepresentable {
    
    @Binding var player : AVPlayer
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<VideoPlayer>) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<VideoPlayer>) {
        
    }
}


