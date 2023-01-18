//
//  UploadView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-11-06.
//

import SwiftUI

struct UploadView: View {
    var body: some View {
        
        
        Menu("Select Media Type") {
            Button(role: .destructive ) {
                
            } label: {
                Text("ungdung")
            }
            Button("e") {
                
            }
            Button("ne") {
                
            }
            Button("ya") {
                
            }
        }
        .foregroundColor(.black)
        .frame(width: 170, height: 40)
        .background(Color("SelectedPage"))
        .cornerRadius(10)
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
