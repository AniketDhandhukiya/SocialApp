import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore

class mainPage3: UIViewController {
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var repasswordTxt: UITextField!
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
        if passwordTxt.text == repasswordTxt.text && repasswordTxt.text != "" {
            
            Auth.auth().createUser(withEmail: emailTxt.text!, password: passwordTxt.text!) {[self] authDataResult, error in
                if error == nil{
                    var uid = authDataResult?.user.uid
                    refr.collection("user").document(uid!).setData(["E-Mail": emailTxt.text!,"password": passwordTxt.text!])
                    navigation()
                    print("done")
                }else{
                    alert(message: "\(error!.localizedDescription)")
                }
            }
        }else{
            alert(message: "Please Check Your Password")
        }
    }
    
    func navigation(){
            let navigate = storyboard?.instantiateViewController(withIdentifier: "signInPage") as! signInPage
            navigationController?.pushViewController(navigate, animated: true)

    }
    
    func alert(message:String){
        let alert = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

