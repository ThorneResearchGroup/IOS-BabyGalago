//
//  ContentView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-03-28.
//

import SwiftUI 

struct ContentView: View {
    
    @EnvironmentObject var apiService: APIService
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var popupManager: PopupManager
    
    var body: some View {
        
        ZStack {
            if apiService.isLoggedin {
                MainView()
            } else {
                withAnimation {
                    LoginView()
                }
            }
            videoInfoPopupView()
        
        }
    }
    
    // Floating Popup with Video info
    @ViewBuilder
    func videoInfoPopupView() -> some View {
        ZStack {
            if popupManager.videoDetailPopup {
                GeometryReader {geometry in
                    VStack {
                        VideoFloatingPopupView(videoIndex: "", popupWidth: (geometry.size.width - 30), popupHeight: (geometry.size.height - 20))
                            .background(Color.white).shadow(radius: 15)
                            .cornerRadius(radius: 15)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                }
                //.offset(x:20, y:-50)
                .background(Color.black.opacity(popupManager.videoDetailPopup ? 0.5 : 0).edgesIgnoringSafeArea(.all))
                
                ZStack {
                    VStack() {
                        Spacer()
                        Button( action: {
                            withAnimation() {
                                popupManager.hideVideoDetailPopup()
                            }
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 30))
                                .frame(width: 60, height: 60)
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(70)
                                .foregroundColor(.white)
                        })
                    }
                }
                .offset(y:17)
            }
        }
        .zIndex(15)
        .animation(.easeIn(duration: 0.3), value: popupManager.videoDetailPopup)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
            .previewInterfaceOrientation(.portrait)
            .environmentObject(APIService())
            .environmentObject(AudioManager())
            .environmentObject(PopupManager())
    }
}
