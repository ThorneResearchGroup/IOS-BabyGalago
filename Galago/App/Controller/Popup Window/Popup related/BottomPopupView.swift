//
//  PopupWindowView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-05-14.
//
// Source code from : https://blog.artemnovichkov.com/custom-popups-in-swiftui
//

import SwiftUI

struct BottomPopupView<Content: View>: View {
    
    
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    content
                        .padding(.bottom, geometry.safeAreaInsets.bottom)
                        .background(Color.white).shadow(radius: 15)
                        .cornerRadius(radius: 16, corners: [.topLeft, .topRight])

                }
                .edgesIgnoringSafeArea([.bottom])
            }
            //.animation(.easeOut)
            //.transition(.move(edge: .bottom))
        }
}


