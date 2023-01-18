//
//  ListViewRow.swift
//  Galago
//
//  Created by Inhee Kim on 2022-10-11.
//

import SwiftUI

struct ListViewRow: View {
    
    @State var img: Image
    
    
    var body: some View {
        
        HStack {
            img
                .resizable()
                .frame(width: 50, height: 50)
            
            
        }
        
    }
}

struct ListViewRow_Previews: PreviewProvider {
    static var previews: some View {
        ListViewRow(img: Image(""))
    }
}
