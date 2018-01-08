//
//  PFQuery+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

extension Reactive where Base: PFQuery<PFObject> {
    public func collectObjects() -> Single<[PFObject]> {
        return singleFromParseCallback({ observer in
            self.base.findObjectsInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func findObjects() -> Observable<PFObject> {
        return collectObjects().asObservable()
            .flatMap{Observable.from($0)}
    }
    
    public func getObject(_ objectId: String) -> Maybe<PFObject> {
        return maybeFromParseCallback({ observer in
            self.base.getObjectInBackground(withId: objectId, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func getFirstObject() -> Maybe<PFObject> {
        return maybeFromParseCallback({ observer in
            self.base.getFirstObjectInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func countObjects() -> Single<Int32> {
        return singleFromParseCallback({ observer in
            self.base.countObjectsInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
}
