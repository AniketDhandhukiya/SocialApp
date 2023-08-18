//
//  mainPage2.swift
//  SocialAp
//
//  Created by R87 on 17/08/23.
//

import UIKit
import iOSDropDown
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class mainPage2: UIViewController {
    //var ref: DatabaseReference!
//    var refr: Firestore!
   var refr = Firestore.firestore()

    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var mobileNoTxt: UITextField!
    @IBOutlet weak var drpdwn: DropDown!

    override func viewDidLoad() {
        super.viewDidLoad()
        drpdwn.optionArray = ["+1","+91"]
        drpdwn.text = drpdwn.optionArray[1]
        //ref = Database.database().reference()

    }
    @IBAction func emailBtn(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "mainPage3") as! mainPage3
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func showDataInFire(){
        refr.collection("user").addDocument(data: ["Mobile no": mobileNoTxt.text!, "Password": passwordTxt.text!])
    }
   
    @IBAction func nextButtonAction(_ sender: Any) {
        showDataInFire()
    }
   

}



//var uid = Auth.auth().currentUser!.uid
//refr.collection("iOS").document(uid).setData(["Phone No":mobileNoTxt.text!,"Password": passwordTxt.text!])
//print("done")
