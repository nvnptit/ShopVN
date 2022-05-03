//
//  LoginViewController.swift
//  SHOPVN
//
//  Created by Nhat on 03/05/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextfield.text = "buitansang@yopmail.com"
        passwordTextfield.text = "buitansang"

    }
    

    @IBAction func didTapLogin() {
        postLogin()
    }
}

extension LoginViewController {
    func postLogin() {
        APIService.login(with: usernameTextfield.text ?? "", and: passwordTextfield.text ?? "") { error, account in
            guard let account = account, let token = account.token else { return }
            if account.success == true {
                print(token)
            }
        }
    }
}
