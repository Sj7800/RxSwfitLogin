//
//  ViewController.swift
//  RxSwfitLogin
//
//  Created by Swapanjeet Singh on 06/08/20.
//  Copyright © 2020 Swapanjeet Singh. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    private let loginViewModel = LoginViewModel()
    private let disposeBag = DisposeBag()

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        print("Tapped Login")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        usernameTextField.becomeFirstResponder()
        
        
        usernameTextField.rx.text.map {$0 ?? "" }.bind(to: loginViewModel.usernameTextPublishSubject).disposed(by: disposeBag)
        passwordTextField.rx.text.map {$0 ?? "" }.bind(to: loginViewModel.passwordTextPublishSubject).disposed(by: disposeBag)
        
        loginViewModel.isValid().bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
        loginViewModel.isValid().map{$0 ? 1 : 0.1 }.bind(to: loginButton.rx.alpha).disposed(by: disposeBag)
        
    }


}


