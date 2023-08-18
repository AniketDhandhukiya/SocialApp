//
//  mainPage3.swift
//  SocialAp
//
//  Created by R87 on 17/08/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore

class mainPage3: UIViewController {
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    var ref: DatabaseReference!
    var refr: Firestore!

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        refr = Firestore.firestore()

    }
    
    @IBAction func phnBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func realTime(){
        ref.child("User").childByAutoId() .setValue(["Email":emailTxt.text!])
        print("done")
    }
    @IBAction func nextButtonAction(_ sender: Any) {
        createAccount()
    }
    func createAccount(){
        Auth.auth().createUser(withEmail: emailTxt.text!, password: passwordTxt.text!) {[self] authDataResult, error in
            if error == nil{
                var uid = authDataResult?.user.uid
                refr.collection("user").document(uid!).setData(["E-Mail": emailTxt.text!,"password": passwordTxt.text!])
                print("done")
            }else{
                print(error?.localizedDescription)
            }
        }
        
    }
    


}


//{
//    Auth.auth().createUser(withEmail: emailTxt.text!,password: passwordTxt.text!) { [self] authResult, error in
//        if error == nil{
//            var uid = authResult?.user.uid
//            refr.collection("iOS").document(uid!).setData(["E-Mail": emailTxt.text!,"password": passwordTxt.text!])
//            print("done")
//        }else{
//            print(error?.localizedDescription)
//        }
//    }
//}
