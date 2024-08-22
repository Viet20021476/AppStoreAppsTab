//
//  Observerable.swift
//  AppStoreAppsTab
//
//  Created by vietnd1 on 22/8/24.
//

import Foundation

class Observable<T> {
    private var observers = [(T) -> Void]()
    
    var value: T {
        didSet {
            notifyObservers()
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(observer: @escaping (T) -> Void) {
        observers.append(observer)
    }
    
    private func notifyObservers() {
        observers.forEach { $0(value) }
    }
}

