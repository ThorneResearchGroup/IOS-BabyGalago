//
//  GalagoApp.swift
//  Galago
//
//  Created by Inhee Kim on 2022-03-28.
//

import SwiftUI

@main
struct GalagoApp: App {
    @StateObject var audioManager = AudioManager()
    @StateObject var apiService = APIService()
    @StateObject var popupManager = PopupManager()
    
    var body: some Scene {
        
        
        WindowGroup {
            ContentView()
                .environmentObject(AudioManager())
                .environmentObject(APIService())
                .environmentObject(PopupManager())
        }
    }
}
