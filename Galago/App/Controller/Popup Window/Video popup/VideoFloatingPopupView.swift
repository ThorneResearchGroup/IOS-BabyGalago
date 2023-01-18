//
//  VideoFloatingPopupView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-11-02.
//

import SwiftUI
import AVKit

struct VideoFloatingPopupView: View {
    
    @EnvironmentObject var apiService: APIService
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var popupManager: PopupManager
    
    @State var videoIndex: String
    @State var popupWidth: CGFloat = 330
    @State var popupHeight: CGFloat = 700
    @State var mediaLoader = MediaLoader()
    
    var body: some View {
        
        let videoURL = "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_5MB.mp4"
        let title = "Joker"
        let year = "2019"
        let ageRestrict = "15"
        let playtime = "2h 2m"
        let description = "A mentally troubled stand-up comedian embarks on a downward spiral that leads to the creation of an iconic villain."
        let director = "Todd Phillips"
        let stars = "Joaquin Phoenix, Robert De Niro, Zazie Beetz"
        
        VStack {
            ScrollView(.vertical) {
                
                HStack {
                    player(videoURL: URL(string: videoURL)!)
                        .frame(height: .infinity, alignment: .center)
                        .padding()
                }
                .frame(height: 230)
                
                VStack(spacing: -33) {
                    HStack {
                        Text(title)
                            .foregroundColor(Color.white)
                            .font(.system(size:55).bold())
                            .padding()
                        Spacer()
                    }
                    
                    // MARK: Video year, age restriction and playtiem
                    HStack {
                        Text("\(year) · \(ageRestrict) · \(playtime)")
                            .foregroundColor(.gray)
                            .font(.system(size:17))
                            .padding()
                        Spacer()
                    }
                    
                    VStack{
                        Spacer()
                        // MARK: Description
                        HStack {
                            Text(description)
                                .font(.system(size:15))
                                .foregroundColor(.white)
                                .padding(15)
                        }
                        Spacer()
                        
                        VStack(spacing: 13) {
                            // MARK: Director
                            HStack {
                                Text("Director")
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray).bold()
                                    .padding(10)
                                
                                Text(director)
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                Spacer()
                            }

                            // MARK: Stars
                            HStack {
                                Text("Stars")
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray).bold()
                                    .padding(10)
                                
                                Text(stars)
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                        }
                        Spacer()
                        
                        PhotoHListView()
                    }
                }
            }
            .frame(width: popupWidth, height: popupHeight)
            .background(.black)
        }
        .onAppear {
            audioManager.Pause()
        }
    }
}

struct VideoFloatingPopupView_Previews: PreviewProvider {
    static var previews: some View {
        VideoFloatingPopupView(videoIndex: "")
            .environmentObject(APIService())
            .environmentObject(AudioManager())
            .environmentObject(PopupManager())
    }
}

struct player: UIViewControllerRepresentable {
    
    @State var videoURL: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {
        
        let player1 = AVPlayer(url: videoURL)
        
        let controller = AVPlayerViewController()
        controller.player = player1
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<player>) {
        
    }
}
