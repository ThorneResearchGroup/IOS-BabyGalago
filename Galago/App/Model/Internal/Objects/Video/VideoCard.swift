//
//  VideoCard.swift
//  Galago
//
//  Created by Inhee Kim on 2022-06-04.
//

import SwiftUI

struct VideoCard: View {
    
    @State var filename: String
    @State var column_count: CGFloat
    
    var base_cardWidth: CGFloat = 320
    var base_cardHeight: CGFloat = 500
    var base_iconSize: CGFloat = 90
    var base_fontSize: CGFloat = 20
    
    var body: some View {
        
        let cardWidth = base_cardWidth / column_count
        let cardHeight = base_cardHeight / column_count
        let iconSize = base_iconSize / column_count
        //let fontSize = base_fontSize / (column_count - (column_count * 0.3))
        
        ZStack {
            ZStack(alignment: .bottomLeading) {
//                AsyncImage(url: URL(string: filename)) { image in
//                    image.resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 160, height: 250)
//                        .cornerRadius(30)
                    Rectangle()
                        .foregroundColor(.black)//.gray.opacity(0.3))
                        .frame(width: cardWidth, height: cardHeight)
                        .cornerRadius(15)
                    Image(filename).resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: cardWidth, height: cardHeight)
                        .cornerRadius(15)
                        .foregroundColor(.black)
                
//                } placeholder: {
//
//                }
                
//                VStack(alignment: .leading) {
//                    Text("2020")
//                        .font(.system(size:fontSize)).bold()
//                        .foregroundColor(.black)
//
//                    Text("Joker")
//                        .font(.system(size:fontSize)).bold()
//                        .foregroundColor(.black)
//                        .multilineTextAlignment(.leading)
//
//                }
//                .foregroundColor(.white)
//                .shadow(radius: 20)
//                .padding()
                
            }
            
            Image(systemName: "play.fill")
                .foregroundColor(.white)
                .font(.system(size:(iconSize / 2)))
                .padding()
                .frame(width: iconSize, height: iconSize, alignment: .center)
                .background(.ultraThinMaterial)
                .cornerRadius(50)
                .opacity(0.3)
                
            
        }
    }
    
    
    
}

struct VideoCard_Previews: PreviewProvider {
    static var previews: some View {
        VideoCard(filename: "", column_count: 2)
    }
}
