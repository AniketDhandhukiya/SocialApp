//
//  mainPage4.swift
//  SocialAp
//
//  Created by R87 on 18/08/23.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class mainPage4: UIViewController {
    
    @IBOutlet weak var codeTxt: UITextField!
    var number = ""
    var id = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(id)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
   
    @IBAction func ResendCode(_ sender: Any) {
        sendOtp()
    }

    @IBAction func submitAction(_ sender: Any) {
        verificationOtp(token: id, otp: codeTxt.text ?? "")
        }
    
    func navigationToLoginPage(){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "signInPage") as! signInPage
        navigationController?.pushViewController(navigate, animated: true)
    }
    
// ****** SEND OTP IN MOBILE ****** //
    func sendOtp(){
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) { verificationId, error in
            if error == nil{
                print("done")
            }else{
                print(error!.localizedDescription)
            }
        }
    }
    
// ****** VERIFY WITH MOBILE OTP ****** //
    func verificationOtp(token:String,otp:String) {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: id, verificationCode: otp)

        Auth.auth().signIn(with: credential){[self] authresult,error in
            if error == nil {
                navigationToLoginPage()
                print(id)
            }
            else{
                print(error?.localizedDescription)
            }
        }
    }
}
