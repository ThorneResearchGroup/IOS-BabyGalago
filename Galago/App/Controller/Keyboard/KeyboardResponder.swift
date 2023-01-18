//
//  KeyboardResponder.swift
//  Galago
//
//  Created by Inhee Kim on 2022-08-16.
//
//  Original Source from : https://blckbirds.com/post/prevent-the-keyboard-from-hiding-swiftui-view/
//

import Foundation
import SwiftUI

class KeyboardResponder: ObservableObject {
    @Published var currentHeight: CGFloat = 0
    
    var _center: NotificationCenter
    init(center: NotificationCenter = .default) {
        _center = center
        _center.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        _center.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            withAnimation {
                currentHeight = keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        withAnimation {
            currentHeight = 0
        }
    }
}
