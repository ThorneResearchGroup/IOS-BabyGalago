//
//  AudioManager.swift
//  Galago
//
//  Created by Inhee Kim on 2022-07-30.
//

import Foundation
import AVKit

final class AudioManager: ObservableObject {
//    static let shared = AudioManager()
    @Published var player: AVAudioPlayer?
    private(set) var barViewHeight = 50.0
    
    @Published private(set) var isPlaying: Bool = false {
        didSet {
            print("isPlaying", isPlaying)
        }
    }
    //@Published public var audioPopover = false
    //@Published public var audioPopover_index = ""
    @Published private var currentTrack: String = ""
    @Published private(set) var isFullyStopped: Bool = false
    
    func startPlayer(track: String, isPreview: Bool = false) {
        
        if track == currentTrack {
            isPlaying = true
            isFullyStopped = false
            player?.play()
            return
        } else {
            currentTrack = track
        }
        
        guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else {
            print("Resource not found: \(track)")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
            
            if isPreview {
                player?.prepareToPlay()
            } else {
                isPlaying = true
                isFullyStopped = false
                player?.play()
                
            }
            
        } catch {
            print("Fail to initialize player", error)
        }
    }
    
    func playPause() {
        guard let player = player else {
            print("Instance of audio player not found")
            return
        }
        
        if player.isPlaying {
            isPlaying = false
            isFullyStopped = false
            player.pause()
            
        } else {
            isPlaying = true
            isFullyStopped = false
            player.play()
            
        }
        
    }
    
    func Pause() {
        guard let player = player else {
            print("Instance of audio player not found")
            return
        }
        
        if player.isPlaying {
            isPlaying = false
            player.pause()
        }
    }
    
    func Stop() {
        guard let player = player else {
            print("Instance of audio player not found")
            return
        }
        
        if player.isPlaying {
            isPlaying = false
        }
        isFullyStopped = true
        player.stop()
        
    }
}
