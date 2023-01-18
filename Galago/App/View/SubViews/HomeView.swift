//
//  HomeView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-03-28.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var apiService: APIService
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var popupManager: PopupManager
    

    var body: some View {
        
        ScrollView(.vertical) {
            VStack(alignment: .leading , spacing: 50) {
                
                // MARK: Movie
                VStack(spacing: -25) {
                    HStack(spacing: 15){
                        Text("Movie")
                            .font(.system(size:45)).bold()
                            .padding()
                        Spacer()
                    }
                    
                    MediaHListView(videoType: "movie")
                    
                    Spacer()
                }
                
                
                // MARK: TVShow
                VStack(spacing: -25) {
                    HStack(spacing: 15){
                        Text("TVShow")
                            .font(.system(size:45)).bold()
                            .padding()
                        Spacer()
                    }
                    
                    MediaHListView(videoType: "tvshow")
                    
                    Spacer()
                }
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(APIService())
            .environmentObject(AudioManager())
            .environmentObject(PopupManager())
            .previewInterfaceOrientation(.portrait)
    }
}
