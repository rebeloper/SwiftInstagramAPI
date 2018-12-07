//
//  AuthViewController.swift
//  SwiftInstagramAPI
//
//  Created by Alex Nagy on 07/12/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import UIKit
import TinyConstraints

class AuthViewController: UIViewController {
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Login to Instagram", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        
        view.addSubview(loginButton)
        loginButton.centerInSuperview()
    }
    
    @objc fileprivate func buttonTapped() {
        login { (result, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            if result {
                print("Successfully logged in.")
                self.navigationController?.popToRootViewController(animated: true)
            } else {
                print("Failed to log in.")
            }
        }
    }
    
    func login(completion: @escaping (_ result: Bool, _ err: Error?) ->()) {
//        instagramApi.login(from: navigationController!, withScopes: [.all], success: {
//            completion(true, nil)
//        }, failure: { err in
//            completion(false, err)
//        })
    }
    
}


