//
//  ParseRxCallbacks.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

class ParseRxCallbacks {
    static func rx_parseCallback<T>(_ observer: AnyObserver<T>) -> (T?, Error?) -> Void {
        return { (t, error) -> Void in
            if let error = error {
                observer.on(.error(error))
            } else if let t = t {
                observer.on(.next(t))
                observer.on(.completed)
            } else {
                observer.on(.completed)
            }
        }
    }
}
