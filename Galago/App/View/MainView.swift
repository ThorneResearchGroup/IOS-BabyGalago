//
//  MainView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-03-28.
//

import SwiftUI

struct MainView: View {
    
    @State var currentTab: String = "Home"
    @State var showMenu: Bool = false
    @State var showSearch: Bool = false
    
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var popupManager: PopupManager
    
    init(){
        UITabBar.appearance().isHidden = true
        
    }
    
    var body: some View {
        
        ZStack {
            SideMenu(currentTab: $currentTab)
            CustomTabView(currentTab: $currentTab, showMenu: $showMenu, showSearch: $showSearch)
                .cornerRadius(showMenu ? 25 : 0)
                .rotation3DEffect(.init(degrees: showMenu ? -30 : 0), axis: (x:0, y: 1, z: 0), anchor: .trailing)
                .offset(x: showMenu ? getRect().width / 2.6 : 0)
                .ignoresSafeArea()
                .fullScreenCover(isPresented: $showSearch) {
                    SearchView(text: "", showSearch: $showSearch)
                }
            
            if(popupManager.audioPopup) {

                let audio = AudioViewModel(audio: audioFile.data)
                BottomPopupView {
                    //AudioPopupView(audioVM: audio, isPresented: $audioManager.audioPopover)
                    AudioBarView(audioVM: audio)
                    // -- AudioBarView is the newest Music bar.
                }
            }

        }
        //.preferredColorScheme(.light)
        
    }

}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environmentObject(AudioManager())
                .environmentObject(APIService())
                .environmentObject(PopupManager())
            
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
