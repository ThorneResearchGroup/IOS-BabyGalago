//
//  NamePopupView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-05-14.
//
// Source code from : https://blog.artemnovichkov.com/custom-popups-in-swiftui
//

import AVKit
import SwiftUI

struct AudioPopupView: View {
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var popupManager: PopupManager
    
    @Binding var audioVM: AudioViewModel
    @Binding var barVisibility: Bool
    
    @State var isPreview: Bool = false
    @State private var value: Double = 0.0
    @State private var pre_value: Double = 0.0
    @State private var progBar_Angle: Double = 0
    @State private var isDragging: Bool = false
    
    private(set) var playButtonWidth: CGFloat = 110
    private(set) var playButtonHeight: CGFloat = 110
    private(set) var progBarStroke: CGFloat = 10
    
    @Environment(\.dismiss) var dismiss
    
    let timer = Timer
        .publish(every: 0.01, on: .main, in: .common)
        .autoconnect()
    
    
    
    @Binding var isPresented: Bool
    
    
    
    var body: some View {
        
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 9) {
                
                HStack {
                    Button(action: {
                        isPresented = false
                    }, label: {
                        Image(systemName: "chevron.down")
                            .font(.system(size:20))
                            .frame(width: 39, height: 39)
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(25)
                            .foregroundColor(.white)
                    })
                    
                    Spacer()
                }
                .offset(y: -10)
                
                Spacer()
                HStack(alignment: .center) {
                    Spacer()
                    Image(audioVM.audio.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: nil, height: 300, alignment: .center)
                        .clipped()
                        .background(Color.black)
                        .padding(12)
                    Spacer()
                }
                // Mark: Title
                Text(audioVM.audio.title)
                    .font(.title)
                    .foregroundColor(.black)
                
                
                if let player = audioManager.player {
                    
                    // MARK: Playback Controls
                    HStack {
                        Spacer()
                        
                        HStack {
                            // MARK: Repeat Button
                            PlaybackControlButton(systemName: "shuffle") {
                                
                            }
                            
                            Spacer()
                            
                            // MARK: Backward Button
                            PlaybackControlButton(systemName: "gobackward.10") {
                                player.currentTime -= 10
                            }
                        }
                        Spacer()
                        
                        VStack {
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
    
                            HStack {
                                Spacer()
                                Text(DateComponentsFormatter.positional.string(from: !isDragging ? value : pre_value) ?? "0:00")
                                    .opacity(!isDragging ? 1 : 0.7)
                                Text(" / ")
                                Text(DateComponentsFormatter.positional.string(from: player.duration) ?? "0:00")
                                Spacer()
                                
                            }
                            .font(.caption)
                        }
                        Spacer()
                        
                        HStack {
                            // MARK: Forward Button
                            PlaybackControlButton(systemName: "goforward.10") {
                                player.currentTime += 10
                            }
                            
                            Spacer()
                            
                            // MARK: Repeat Button
                            PlaybackControlButton(systemName: "repeat") {
                                
                            }
                        }
                        Spacer()
                        
                    }
                }
                
                Spacer()
            }
            .padding()
            .gesture(DragGesture(minimumDistance: 100, coordinateSpace: .local)
                .onEnded({ value in
                    
//
//
//                    if value.translation.width > 0 {
//                        // right
//                    }
//                    if value.translation.height < 0 {
//                        // up
//                    }
                    
                    if value.translation.height > 100 {
                        // down
                        isPresented = false
                    }
                }))
            //
            //    .frame(height: 210.0)
            
            
        }
        .onAppear {
            withAnimation {
                barVisibility = false
            }
        }
        .onDisappear {
            withAnimation {
                barVisibility = true
            }
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
    }
}

struct AudioPopupView_Previews: PreviewProvider {
    
    static var previews: some View {
        AudioPopupView(audioVM: .constant(AudioViewModel(audio: audioFile.data)), barVisibility: .constant(false), isPreview: true, isPresented: .constant(true))
            .environmentObject(AudioManager())
            .environmentObject(PopupManager())
            .previewLayout(.sizeThatFits)
        
        
    }
}



