//
//  signInPage.swift
//  SocialAp
//
//  Created by R87 on 17/08/23.
//

import UIKit

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
        navigatioForLoginButton()
    }
    @IBAction func sighupButtonAction(_ sender: Any) {
        navigatioForSignupButton()
    }
    
    func navigatioForLoginButton(){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "tabBar") as! tabBar
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    func navigatioForSignupButton(){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "infoForSignup") as! infoForSignup
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
