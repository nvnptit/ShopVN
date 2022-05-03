//
//  RegisterViewController.swift
//  SHOPVN
//
//  Created by Nhat on 03/05/2022.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboard()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnView))
        view.addGestureRecognizer(gesture)

        // Do any additional setup after loading the view.
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
    @IBAction func didTapSignUp() {
        postRegister()
    }

    @IBAction func didTapSignIn() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let register = sb.instantiateViewController(withIdentifier: "LoginViewController")
        self.navigationController?.pushViewController(register, animated: true)
    }
    
}
extension RegisterViewController{
    func postRegister(){
        APIService.register(with: usernameTextfield.text ?? "", and: passwordTextfield.text ?? "") { error,user in
            guard let account = user, let token = account.token else { return}
            if account.success == true {
                print("success!!!")
            }else {
                print("!success!!!")
            }
        }
    }
}
//APIService.postRegister(with: emailTextField.text ?? "", and: passwordTextField.text ?? "") { accountUser, error in
//    guard let accountUser = accountUser else { return }
//    guard let token = accountUser.token else { return }
//    UserService.shared.setToken(with: token)
//
//  DispatchQueue.main.async {
//        print(accountUser.user)
//        self.checkRegister = accountUser.success
//
//        if self.checkRegister == true {
//            let sb = UIStoryboard(name: "Main", bundle: nil)
// let profileVC = sb.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
//            self.navigationController?.pushViewController(profileVC, animated: true)
//        }
//    }
//}
