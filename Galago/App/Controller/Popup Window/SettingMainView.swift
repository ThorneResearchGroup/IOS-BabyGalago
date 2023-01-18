//
//  SettingMainView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-11-11.
//

import SwiftUI

struct SettingMainView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            VStack {
     
                ZStack {
                    NavigationView {
                        GeometryReader {geometry in
                            List {
                                NavigationLink("User Setting") {
                                    Text("das gut")
                                }
                                NavigationLink("Server Setting") {
                                    Text("das gut")
                                }
                                
                                NavigationLink("About us") {
                                    let context = "About us \n\n Galago is developed by Thorne Research Group, a group of passionate open-source software developers. Our goal is to give power back to the private archive operators by open-sourcing as much of our software as possible, making it so that you don’t run any proprietary code on your server. You can have complete confidence that your system is doing what you ask, only when you ask and is not sending any data back to the software developers.\n\n We are dedicated to long-term support and development as we also use this system for our archive. We will never: \n Force users to pay more by increasing monthly subscription payments \nMake previously open-source software proprietary\nSend any non-essential data to our servers\nPerform any actions on your data without being requested\n\nIn these ways and more, we aim to empower the next generation of open-source software developers to continue bearing the open-source torch into the future."
                                    
                                    Text(context)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                }
                                
                                NavigationLink("Licenses") {
                                    let context = "Technologies used: \n\nSpectreCSS - License\nJ2HTML - License\nMariaDB - License\nSQLite - License\nHikariCP - License\nLombok - License\nGSON - License\nRetrofit - License\nActiveJ - License\nJava-JWT - License\nBouncyCastle - License\nBrotli4j - License\nCaffeine - License\nMeiliSearch - License\nThumbnailator - License\nQuartz - License\nJunit5 - License\nPalila - License\n"
                                    
                                    Text(context)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                }
                                
                            }
                            
                        }
                    }
                    
                }
            }
            
            ZStack {
                VStack {
                    Spacer()
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
                    }
                }
            }
            .padding()

        }
    }
}

struct SettingMainView_Previews: PreviewProvider {
    static var previews: some View {
        SettingMainView(isPresented: .constant(true))
    }
}
