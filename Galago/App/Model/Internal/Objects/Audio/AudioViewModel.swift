//
//  AudioViewModel.swift
//  Galago
//
//  Created by Inhee Kim on 2022-07-30.
//

import Foundation

final class AudioViewModel: ObservableObject {
    private(set) var audio: audioFile
    
    init(audio: audioFile) {
        self.audio = audio
    }
}

struct audioFile {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    
    static let data = audioFile(title: "Powerful beat - penguinmusic", description: "This is Sample music", duration: 74, track: "sample music", image: "Audio_cover 1")
}
