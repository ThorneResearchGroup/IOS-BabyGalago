//
//  SideMenu.swift
//  Galago
//
//  Created by Inhee Kim on 2022-03-28.
//

import SwiftUI

struct SideMenu: View {
    
    @EnvironmentObject var apiService: APIService
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var popupManager: PopupManager
    
    @Binding var currentTab: String
    @State var popupSetting: Bool = false
    @Namespace var animation
    
    var body: some View {
        
        VStack{
            
            // -- Account Section -- //

            HStack(spacing: 15) {
                Image(systemName: "person")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color("Font"))
                Text(apiService.user.username != "" ? apiService.user.username : "Inhee")
                    .font(.title2.bold())
                    .foregroundColor(Color("Font"))
                Spacer()
                Image(systemName: "gear")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color("Font"))
                    .onTapGesture {
                        popupSetting = true
                    }
                Spacer()
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)


            // -- Menu Section -- //
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false, content: {
                VStack(alignment: .leading, spacing: 25) {
                    
                    CustomTabButton(icon: "house", title: "Home")
                    CustomTabButton(icon: "play.rectangle", title: "Movie")
                    CustomTabButton(icon: "play.tv", title: "TV Show")
                    CustomTabButton(icon: "headphones", title: "Music")
                    //CustomTabButton(icon: "gear", title: "Settings")
                    Spacer()
                    
                    Button(action: {
                        apiService.Logout()
                        
                    }) {
                        LogoutButtonContent()
                            .offset(y: popupManager.audioPopup ? -audioManager.barViewHeight : 0)
                    }
                }
                .padding()
                .padding(.top, 15)
                
            })
            .frame(width: getRect().width / 1.1, alignment: .leading)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .padding(.leading, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BackendBG"))
        .fullScreenCover(isPresented: $popupSetting, content: {
            SettingMainView(isPresented: $popupSetting)
        })
    }
    
    @ViewBuilder
    func  CustomTabButton(icon: String, title: String) -> some View {
        Button{
            withAnimation(.spring(response: 0.31)) {
                currentTab = title
            }
        } label: {
            HStack(spacing: 12) {
                
                Image(systemName: icon)
                    .font(.system(size: 25))
                    .frame(width: currentTab == title ? 50 : nil, height: 50, alignment: .center)
                    .scaledToFit()
                    .foregroundColor(Color("Font"))
                    .background(
                        ZStack{
                            if currentTab == title {
                                Color.white
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "TABCIRCLE", in: animation)
                                
                            }
                        }
                    )
                
                Text(title)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Font"))
                
            }
            .padding(.trailing, 18)
            .background(
                ZStack{
                    if currentTab == title {
                        Color("SelectedPage")
                            .clipShape(Capsule())
                            .matchedGeometryEffect(id: "TABCAPSULE", in: animation)
                    }
                }
            )
        }
        .offset(x: currentTab == title ? 10 : 0)
    }
}

struct LogoutButtonContent: View {
    var body: some View {
        HStack(spacing: 12) {
            //rectangle.portrait.and.arrow.right
            Image(systemName: "rectangle.portrait.and.arrow.right")
                .font(.system(size: 25))
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(Color("Font"))
                .scaledToFit()
                
            Text("Logout")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(Color("Font"))
                .padding()
            
        }
        //.frame(width: 170, height: 50)
        //.background(Color("LogoutBG"))
        //.cornerRadius(15.0)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AudioManager())
            .environmentObject(APIService())
            .environmentObject(PopupManager())
    }
}

extension View {
    func  getRect()->CGRect {
        return UIScreen.main.bounds
    }
}
