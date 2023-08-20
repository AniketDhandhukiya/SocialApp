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
import UserNotifications

class mainPage2: UIViewController {
   var refr = Firestore.firestore()

    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var mobileNoTxt: UITextField!
    @IBOutlet weak var drpdwn: DropDown!
    
    var null = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        drpdwn.optionArray = ["+1","+91","+56","+101","+96"]
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
    
    @IBAction func nextButtonAction(_ sender: Any) {
        null = "\(drpdwn.text!)\(mobileNoTxt.text!)"
        showDataInFire()
    }

    
// ******* mobile authentication ***** //
    
    func showDataInFire(){
        //let uid = Auth.auth().currentUser!.uid
        refr.collection("user").addDocument(data: ["Mobile no": null, "Password": passwordTxt.text!]) {[self] error in
            if error == nil{
                if mobileNoTxt.text! != "" {
                    let navigate = storyboard?.instantiateViewController(withIdentifier: "mainPage4") as! mainPage4
                    navigate.number = null
                    navigationController?.pushViewController(navigate, animated: true)
                    verifyOtp()
                    popUp()
                }
            }
            else{
                showAlert(messege:error!.localizedDescription , title: "Error")
            }
        }
    }
   
    func verifyOtp(){
        PhoneAuthProvider.provider().verifyPhoneNumber(null, uiDelegate: nil) { verificationId, error in
            if error == nil{
                UserDefaults.standard.set(verificationId, forKey: "id")
                print("done")
            }else{
                print(error!.localizedDescription)
            }
        }
    }
    
    func verificationOtp(token:String,otp:String) {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: token, verificationCode: otp)

        Auth.auth().signIn(with: credential){authresult,error in
            if error == nil {
                print("Ok")
            }
            else{
                print(error?.localizedDescription)
            }
        }
    }
    
    func popUp(){
        let authoptions = UNAuthorizationOptions(arrayLiteral:.alert,.badge,.sound)
                UNUserNotificationCenter.current().requestAuthorization(options: authoptions) { (success , error) in print("error:", error?.localizedDescription)
                    
                }
                
                let content = UNMutableNotificationContent()
                content.title = "OTP-SocialAPP"
                content.body = "hello ios developer"
                content.badge = 1
                
                let trigger = UNTimeIntervalNotificationTrigger(
                    timeInterval: 5,
                repeats: false
                
                )
                let id = UUID().uuidString
                let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
                let notification = UNUserNotificationCenter.current()
                notification.add(request) { error in
                    print(error?.localizedDescription)
                    
                }


    }
// ******* Alert ***** //
    
    func showAlert(messege: String,title: String){
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default,handler: nil))
        present(alert, animated: true,completion: nil)
    }
}
