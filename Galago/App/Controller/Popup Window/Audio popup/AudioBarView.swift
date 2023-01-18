//
//  NamePopupView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-08-17.
//
// Source code from : https://blog.artemnovichkov.com/custom-popups-in-swiftui
//

import AVKit
import SwiftUI

struct AudioBarView: View {
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var popupManager: PopupManager
    
    @State var audioVM: AudioViewModel
    @State var isPreview: Bool = false
    @State private var value: Double = 0.0
    @State private var pre_value: Double = 0.0
    @State private var progBar_Angle: CGFloat = 0

    @State private var isDragging: Bool = false
    
    private(set) var playButtonWidth: CGFloat = 40
    private(set) var playButtonHeight: CGFloat = 40
    private(set) var progBarStroke: CGFloat = 5
    
    
    @State private var showingPopover = false
    @State private var barVisibility = false
    @Environment(\.dismiss) var dismiss
    

    let timer = Timer
        .publish(every: 0.01, on: .main, in: .common)
        .autoconnect()
    
    
    
    var body: some View {
        
        
        ZStack(alignment: .top) {
            
            VStack(alignment: .leading, spacing: 9) {
                
                
                HStack {
                    
                    Button(action: {
                        audioManager.Pause()
                        popupManager.hideAudioPopup()
                    }, label: {
                        Image(systemName: "xmark")
                            .imageScale(.small)
                            .frame(width: 25, height: 25)
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(16)
                            .foregroundColor(.white)
                    })
                    
                    Spacer()
                    // Mark: Title
                    Button(action: {
                        withAnimation {
                            self.showingPopover = true
                        }
                    })
                    {
                        Text(audioVM.audio.title)
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    ZStack {
                        
                        if let player = audioManager.player {
                            
                            PlaybackControlButton(systemName: player.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSize: playButtonWidth) {
                                if !isDragging {
                                    withAnimation(.easeIn(duration: 0.1)) {
                                        audioManager.playPause()
                                    }
                                }
                            }
                            .contentShape(Circle())
                            .gesture(
                                DragGesture()
                                    .onChanged ({ v in
                                        
                                        isDragging = true
                                        
                                        let strokeCal = progBarStroke * 2
                                        // the following codes are to obtain angle value
                                        progBar_Angle = atan2(v.location.x - (playButtonWidth + strokeCal) / 2, (playButtonHeight + strokeCal) / 2 - v.location.y) * 180 / .pi
                                        
                                        if (progBar_Angle > 360) { progBar_Angle = 360}
                                        if (progBar_Angle < 0) { progBar_Angle += 360 }
                                        
                                        pre_value = (player.duration * (progBar_Angle / 360))
                                        //print(value)
                                        //print(player.duration)
                                        //print("Angle - \(progBar_Angle) - ")
                                    })
                                    .onEnded ({ v in
                                        value = pre_value
                                        player.currentTime = pre_value
                                        isDragging = false
                                        pre_value = 0
                                    })
                            )
                            
                            withAnimation() {
                                MusicProgressBar(pre_progress: $pre_value, progress: $value, duration: player.duration, width: playButtonWidth, height: playButtonHeight, strokeThickness: progBarStroke)
                                
                            }

                        }
                    }
                    // MARK: Playback
                    
                }
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                    .onEnded({ value in
                                        if value.translation.width < 0 {
                                            // left
                                        }

                                        if value.translation.width > 0 {
                                            // right
                                        }
                                        if value.translation.height < -10 {
                                            // up
                                            showingPopover = true
                                        }

                                        if value.translation.height > 0 {
                                            // down
                                        }
                                    }))
//
                Spacer()
            }
            .padding()
            .offset(y:17)
            .frame(height: audioManager.barViewHeight)
        

        }
        .onAppear {
            //AudioManager.shared.startPlayer(track: audioVM.audio.track, isPreview: isPreview)
            showingPopover = true
            audioManager.startPlayer(track: audioVM.audio.track, isPreview: isPreview)
        }
        .onDisappear {
            audioManager.Pause()
        }
        .background(Color("Popups"))
        .onReceive(timer) { _ in
            
            guard let player = audioManager.player else { return }
            
            //if !isDragging {
                value = player.currentTime
            //}
            if player.currentTime == player.duration {
                audioManager.Stop()
            }
            
        }
        .fullScreenCover(isPresented: $showingPopover)
        {
            AudioPopupView(audioVM: self.$audioVM, barVisibility: $barVisibility, isPresented: self.$showingPopover)
        }
    }
}

struct AudioBarView_Previews: PreviewProvider {
    static let audioVM = AudioViewModel(audio: audioFile.data)
    
    static var previews: some View {
        AudioBarView(audioVM: audioVM, isPreview: true)
            .environmentObject(AudioManager())
            .environmentObject(PopupManager())
            .previewLayout(.sizeThatFits)
           
        
    }
}



