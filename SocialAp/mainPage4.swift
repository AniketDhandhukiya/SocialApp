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
    var id = UserDefaults.standard.string(forKey: "id")
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
   

    @IBAction func ResendCode(_ sender: Any) {
        sendOtp()
    }

    
    @IBAction func submitAction(_ sender: Any) {
        print(id!)
    }
    func sendOtp(){
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) { verificationId, error in
            if error == nil{
                print("done")
            }else{
                print(error!.localizedDescription)
            }
        }
    }
    
    func verificationOtp() {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: id!, verificationCode: codeTxt.text!)

        Auth.auth().signIn(with: credential){authresult,error in
            if error == nil {
                print("Ok")
            }
            else{
                print(error?.localizedDescription)
            }
        }
    }
}
