

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore

class NewPost: UIViewController, UINavigationControllerDelegate & UIImagePickerControllerDelegate {

    @IBOutlet weak var ImageForUpload: UIImageView!
    
    var ref: DatabaseReference!
    var refr: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        refr = Firestore.firestore()
        
    }
    
    @IBAction func gallaryButtonAction(_ sender: Any) {
        openGallery()
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        ImageForUpload.image = info[.editedImage] as! UIImage
        dismiss(animated: true,completion: nil)
    }
    func openGallery(){
        let gallery = UIImagePickerController()
        gallery.delegate = self
        gallery.allowsEditing = true
        gallery.sourceType = .photoLibrary
        present(gallery, animated: true,completion: nil)
    }
   
}
