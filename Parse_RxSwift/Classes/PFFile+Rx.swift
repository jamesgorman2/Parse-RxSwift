//
//  PFFile+Rx.swift
//  Parse+RxSwift
//
//  Created by Leone Parise Vieira da Silva on 26/12/16.
//  Copyright © 2016 Andrew Breckenridge. All rights reserved.
//

import RxSwift
import Parse

extension Reactive where Base: PFFile {
    public func save() -> Completable {
        return successFromParseCallback({ observer in
            self.base.saveInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func saveWithProgress() -> Observable<Int32> {
        return observableFromParseCallback({ observer in
            self.base.saveInBackground(progressBlock: { progress in
                observer.onNext(progress)
                if progress > 99 { observer.onCompleted() }
            })
        })
    }
    
    public func getData() -> Single<Data> {
        return singleFromParseCallback({ observer in
            self.base.getDataInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func getDataStream() -> Observable<InputStream> {
        return observableFromParseCallback({ observer in
            self.base.getDataStreamInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
    
    public func getDataStream(dispatchQueue: DispatchQueue) -> Single<InputStream> {
        return singleFromParseCallback({ observer in
            self.base.getDataStreamInBackground(block: ParseRxCallbacks.rx_parseCallback(observer))
        })
    }
}
