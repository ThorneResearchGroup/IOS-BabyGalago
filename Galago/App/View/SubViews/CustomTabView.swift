//
//  CustomTabView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-03-28.
//

import SwiftUI

struct CustomTabView: View {
    
    @Binding var currentTab: String
    @Binding public var showMenu: Bool
    @Binding public var showSearch: Bool
    
    var animationSpeed: Double = 0.27
    
    
    var body: some View {
        VStack{
            HStack{
                
                // MARK: Hamburger Menu Button
                Button {
                    withAnimation(.spring(response: animationSpeed, dampingFraction: 1, blendDuration: 0.0)) {
                        showMenu = true
                    }
                } label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 25))
                        .foregroundColor(Color("Font"))
                        .imageScale(.large)
                    
                }
                .opacity(showMenu ? 0 : 1)
                Spacer()
                
                // MARK: Search button
                Button {
                    withAnimation(.spring(response: animationSpeed, dampingFraction: 1, blendDuration: 0.0)) {
                        showSearch = true
                    }
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 15))
                        .foregroundColor(Color("Font"))
                        .imageScale(.large)
                        .padding()
                    
                }
                
                
            }
            .overlay(
                Text(currentTab)
                    .font(.system(size: 25))
                    .foregroundColor(Color("Font"))
                    .opacity(showMenu ? 0 : 1)
            )
            .padding([.horizontal, .top])
            .padding(.bottom, 8)
            .padding(.top, getSafeArea().top)
            
            TabView(selection: $currentTab) {
                HomeView()
                    .tag("Home")
                MovieView(text: "")
                    .tag("Movie")
                TVShowView(text: "")
                    .tag("TV Show")
                AudioView(text: "")
                    .tag("Music")
                UserSettingsView()
                    .tag("Settings")
            }
        }
        .disabled(showMenu)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .offset(y: -20)
        .overlay(
            Button {
                withAnimation(.spring(response: animationSpeed, dampingFraction: 1, blendDuration: 0.0)) {
                    showMenu = false
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.black)
            }
                .opacity(showMenu ? 1 : 0)
                .padding()
                .padding(.top)
            ,alignment: .topLeading
        )
        .background(Color("BG"))
        .onTapGesture {
            withAnimation(.spring(response: animationSpeed, dampingFraction: 1, blendDuration: 0.0)){
                showMenu = false
            }
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AudioManager())
            .environmentObject(APIService())
            .environmentObject(PopupManager())
    }
}
