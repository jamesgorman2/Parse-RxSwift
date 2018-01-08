//
//  PFObject+Rx.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift
import Parse

extension Reactive where Base: PFObject {
    public func save() -> Completable {
        return successFromParseCallback({ observer in
            self.base.saveInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func unpin(withName name:String) -> Completable {
        return successFromParseCallback({ observer in
            self.base.unpinInBackground(withName: name, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func fetch() -> Single<PFObject> {
        return singleFromParseCallback({ observer in
            self.base.fetchInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func fetchIfNeeded() -> Single<PFObject> {
        return singleFromParseCallback({ observer in
            self.base.fetchIfNeededInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func delete() -> Completable {
        return successFromParseCallback({ observer in
            self.base.deleteInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func saveAll(_ objects: [PFObject]) -> Completable {
        return successFromParseCallback({ observer in
            PFObject.saveAll(inBackground: objects, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func collectAll(_ objects: [PFObject]) -> Single<[PFObject]> {
        return singleFromParseCallback({ observer in
            PFObject.fetchAll(inBackground: objects, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
            .map{$0 as! [PFObject]}
    }
    
    public static func fetchAll(_ objects: [PFObject]) -> Observable<PFObject> {
        return collectAll(objects).asObservable()
            .flatMap{Observable.from($0)}
    }

    public static func collectAllIfNeeded(_ objects: [PFObject]) -> Single<[PFObject]> {
        return singleFromParseCallback({ observer in
            PFObject.fetchAllIfNeeded(inBackground: objects, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
            .map{$0 as! [PFObject]}
    }

    public static func fetchAllIfNeeded(_ objects: [PFObject]) -> Observable<PFObject> {
        return collectAllIfNeeded(objects).asObservable()
            .flatMap{Observable.from($0)}
    }
}

// MARK: Local Datastore
extension Reactive where Base:PFObject {
    public func saveEventually() -> Completable {
        return successFromParseCallback({ observer in
            self.base.saveEventually(ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func pin() -> Completable {
        return successFromParseCallback({ observer in
            self.base.pinInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func pin(withName name:String) -> Completable {
        return successFromParseCallback({ observer in
            self.base.pinInBackground(withName: name, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func unpin() -> Completable {
        return successFromParseCallback({ observer in
            self.base.unpinInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func pinAll(_ objects: [PFObject]) -> Completable {
        return successFromParseCallback({ observer in
            PFObject.pinAll(inBackground: objects, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func pinAll(_ objects: [PFObject], withName name:String) -> Completable {
        return successFromParseCallback({ observer in
            PFObject.pinAll(inBackground: objects, withName: name, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func unpinAll(_ objects: [PFObject]) -> Completable {
        return successFromParseCallback({ observer in
            PFObject.unpinAll(inBackground: objects, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public static func unpinAll(_ objects: [PFObject], withName name:String) -> Completable {
        return successFromParseCallback({ observer in
            PFObject.unpinAll(inBackground: objects, withName: name, block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
}
