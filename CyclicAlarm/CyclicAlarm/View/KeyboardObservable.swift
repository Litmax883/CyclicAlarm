//
//  KeyboardObservable.swift
//  Famer
//
//  Created by Dmitriy Yurchenko on 02.03.2020.
//  Copyright © 2020 Aleksandr Zhovtyi. All rights reserved.
//

import Foundation
import UIKit
import ObjectiveC.runtime

typealias KeyboardStateInfo = (keyboardFrame: CGRect, duration: Double)

enum KeyboardAppearanceState {
    
    case willShow(KeyboardStateInfo)
    case didShow(KeyboardStateInfo)
    
    case willChange(KeyboardStateInfo)
    case didChange(KeyboardStateInfo)
    
    case willHide(KeyboardStateInfo)
    case didHide(KeyboardStateInfo)
}

fileprivate var observersAssociatedKey = "observersAssociatedKey"

protocol KeyboardObservable: class {
    func registerObservers()
    func unregisterObservers()
    
    func keyboardStateChanged(state: KeyboardAppearanceState)
}

extension KeyboardObservable {
    
    func registerObservers() {
        observers = [
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main, using: { [weak self] (notification) in
                guard let self = self else { return }
                self.keyboardStateChanged(state: KeyboardAppearanceState.willShow(self.getKeyboardInfo(fromNotification: notification)))
            }),
        
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: .main, using: { [weak self] (notification) in
                guard let self = self else { return }
                self.keyboardStateChanged(state: KeyboardAppearanceState.didShow(self.getKeyboardInfo(fromNotification: notification)))
            }),
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillChangeFrameNotification, object: nil, queue: .main, using: { [weak self] (notification) in
                guard let self = self else { return }
                self.keyboardStateChanged(state: KeyboardAppearanceState.willChange(self.getKeyboardInfo(fromNotification: notification)))
            }),
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidChangeFrameNotification, object: nil, queue: .main, using: { [weak self] (notification) in
                guard let self = self else { return }
                self.keyboardStateChanged(state: KeyboardAppearanceState.didChange(self.getKeyboardInfo(fromNotification: notification)))
            }),
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main, using: { [weak self] (notification) in
                guard let self = self else { return }
                self.keyboardStateChanged(state: KeyboardAppearanceState.willHide(self.getKeyboardInfo(fromNotification: notification)))
            }),
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification, object: nil, queue: .main, using: { [weak self] (notification) in
                guard let self = self else { return }
                self.keyboardStateChanged(state: KeyboardAppearanceState.didHide(self.getKeyboardInfo(fromNotification: notification)))
            })
        ]
    }
    
    func unregisterObservers() {
        observers.forEach { NotificationCenter.default.removeObserver($0) }
        observers = []
    }
}

private extension KeyboardObservable {
    var observers: [Any] {
        get { (objc_getAssociatedObject(self, &observersAssociatedKey) as? [Any]) ?? []  }
        set { objc_setAssociatedObject(self, &observersAssociatedKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC) }
    }
    
    func getKeyboardInfo(fromNotification notif: Notification) -> KeyboardStateInfo {
        guard let userInfo = notif.userInfo else { fatalError() }
        
        return ((userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect) ?? .zero, (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? .zero)
    }
}
