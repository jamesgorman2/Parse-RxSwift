//
//  Observable+ParseCreate.swift
//  Parse-RxSwift Extensions
//
//  Created by Eric Kuck on 10/8/15.
//  Copyright © 2015 BlueLine Labs. All rights reserved.
//

import RxSwift

func observableFromParseCallback<T>(_ callback: @escaping ((AnyObserver<T>) -> Void)) -> Observable<T> {
    return Observable.create({ (observer: AnyObserver<T>) -> Disposable in
        callback(observer)
        return Disposables.create()
    })
}

func maybeFromParseCallback<T>(_ callback: @escaping ((AnyObserver<T>) -> Void)) -> Maybe<T> {
    return observableFromParseCallback(callback).asMaybe()
}

func singleFromParseCallback<T>(_ callback: @escaping ((AnyObserver<T>) -> Void)) -> Single<T> {
    return observableFromParseCallback(callback).asSingle()
}

func successFromParseCallback(_ callback: @escaping ((AnyObserver<Bool>) -> Void)) -> Completable {
    return observableFromParseCallback(callback).filter{$0}.asSingle().asObservable().ignoreElements()
}

