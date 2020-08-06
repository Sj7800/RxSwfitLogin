//
//  LoginViewModel.swift
//  RxSwfitLogin
//
//  Created by Swapanjeet Singh on 06/08/20.
//  Copyright © 2020 Swapanjeet Singh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewModel {
    let usernameTextPublishSubject = PublishSubject<String>()
    let passwordTextPublishSubject = PublishSubject<String>()
    
    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(usernameTextPublishSubject.asObservable().startWith(""), passwordTextPublishSubject.asObservable().startWith("")).map { username, password in
            return username.count > 3 && password.count > 3
        }.startWith(false)
    }
}
