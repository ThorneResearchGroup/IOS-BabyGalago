//
//  PopupManager.swift
//  Galago
//
//  Created by Inhee Kim on 2022-11-03.
//

import Foundation

final class PopupManager: ObservableObject {
    
    @Published private(set) public var videoDetailPopup = false
    @Published private(set) public var audioPopup = false
    
    func showVideoInfoPopup() {
        if audioPopup { audioPopup = false }
        videoDetailPopup = true
    }
    
    func hideVideoDetailPopup() {
        videoDetailPopup = false
    }
    
    func showAudioPopup() {
        if videoDetailPopup { videoDetailPopup = false }
        audioPopup = true
    }
    
    func hideAudioPopup() {
        audioPopup = false
    }
    
    
    
    
}
