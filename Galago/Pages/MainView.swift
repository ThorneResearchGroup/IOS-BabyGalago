//
//  MainView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-03-28.
//

import SwiftUI

struct MainView: View {
    
    @State var currentTab: String = "home"
    @State var showMenu: Bool = false
    @EnvironmentObject var audioManager: AudioManager
    
    init(){
        UITabBar.appearance().isHidden = true
        
    }
    
    var body: some View {
        
        ZStack {
            SideMenu(currentTab: $currentTab)
            CustomTabView(currentTab: $currentTab, showMenu: $showMenu)
                .cornerRadius(showMenu ? 25 : 0)
                .rotation3DEffect(.init(degrees: showMenu ? -10 : 0), axis: (x:0, y: 1, z: 0), anchor: .trailing)
                .offset(x: showMenu ? getRect().width / 2.6 : 0)
                .ignoresSafeArea()
            if(audioManager.audioPopover == true) {
                
                let audio = AudioViewModel(audio: audioFile.data)
                BottomPopupView {
                    //AudioPopupView(audioVM: audio, isPresented: $audioManager.audioPopover)
                    AudioBarView(audioVM: audio, isPresented: $audioManager.audioPopover)
                    // -- AudioBarView is the newest Music bar.
                }
            }
        }
        .preferredColorScheme(.light)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environmentObject(AudioManager())
            
        }
    }
}

extension View {
    func getSafeArea()-> UIEdgeInsets {
        guard let screen =
                UIApplication.shared.connectedScenes.first as?
                UIWindowScene else {
                    return .zero
                }
                
        guard let safeArea = screen.windows.first?.safeAreaInsets
        else{
            return .zero
        }
        return safeArea
    }
}
