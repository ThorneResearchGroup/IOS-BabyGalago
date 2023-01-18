//
//  SeachView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-04-02.
//

import SwiftUI

struct SearchView: View {
    @State var text: String
    @Binding var showSearch: Bool
    
    var body: some View {
        VStack(spacing: 10.0) {
            
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                    
                    
                    TextField("Search", text: $text)
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.8980392156862745, green: 0.8980392156862745, blue: 0.8980392156862745)/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
                
                Spacer()
                Button("Cancel") {
                    withAnimation {
                        showSearch = false
                    }
                }
            }
            .padding()
            
            Spacer()
            
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: "", showSearch: .constant(true))
    }
}
