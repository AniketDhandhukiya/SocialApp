//
//  signInPage.swift
//  SocialAp
//
//  Created by R87 on 17/08/23.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

class signInPage: UIViewController {
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var phoneOrEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.layer.cornerRadius = 9
        loginBtn.layer.shadowColor = UIColor.systemGray3.cgColor
        loginBtn.layer.shadowRadius = 4.0
        loginBtn.layer.shadowOpacity = 4.4
        loginBtn.layer.shadowOffset = CGSize(width: 4, height: 4)
        loginBtn.layer.masksToBounds = false
        
        signUpBtn.layer.cornerRadius = 9
        signUpBtn.layer.shadowColor = UIColor.systemGray3.cgColor
        signUpBtn.layer.shadowRadius = 4.0
        signUpBtn.layer.shadowOpacity = 4.4
        signUpBtn.layer.shadowOffset = CGSize(width: 4, height: 4)
        signUpBtn.layer.masksToBounds = false
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        signIn()
    }
    
    
    @IBAction func SignUpBtn(_ sender: Any) {
        navigatioForSignupButton()
    }
    func navigatioForLoginButton(){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "tabBar") as! tabBar
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    func navigatioForSignupButton(){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "mainPage2") as! mainPage2
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func alert(message:String){
        let alert = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func signIn(){
        Auth.auth().signIn(withEmail: phoneOrEmailTextField.text!, password: passwordTextField.text!) {[self] authDataResult, error in
            if error == nil {
                navigatioForLoginButton()
            }else{
                alert(message: "\(error!.localizedDescription)")
            }
        }
        
    }
    
    @IBAction func signInFb(_ sender: Any) {
        googleSignIn()
    }
    func googleSignIn(){
        guard let clientID = FirebaseApp.app()?.options.clientID else{return}
        let configure = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = configure
        GIDSignIn.sharedInstance.signIn(withPresenting: self){[unowned self] result, error in
            guard error == nil else{
                return
            }
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else{
                return
            }
            let crendential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
        }
    }
}
