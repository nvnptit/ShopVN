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
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextfield.text = ""
        passwordTextfield.text = ""
        setupKeyboard()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnView))
        view.addGestureRecognizer(gesture)
    }
    
    private func setupKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func didTapOnView() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 70
        scrollView.contentInset = contentInset
    }
    @objc func keyboardWillHide(notification:NSNotification) {

        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    @IBAction func didTapLogin() {
        postLogin()
    }

    @IBAction func didTapRegister() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let register = sb.instantiateViewController(withIdentifier: "RegisterViewController")
        self.navigationController?.pushViewController(register, animated: true)
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
