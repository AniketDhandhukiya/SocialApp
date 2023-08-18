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
                let navigate = storyboard?.instantiateViewController(withIdentifier: "mainPage4") as! mainPage4
                navigationController?.pushViewController(navigate, animated: true)
                print("done")
            }else{
                print(error?.localizedDescription)
            }
        }
    }
}

