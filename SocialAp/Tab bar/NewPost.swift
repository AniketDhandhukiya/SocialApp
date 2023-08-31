

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import FirebaseStorage

class NewPost: UIViewController, UINavigationControllerDelegate & UIImagePickerControllerDelegate {

    @IBOutlet weak var vieww: UIView!
    @IBOutlet weak var ImageForUpload: UIImageView!
    
    var ref: DatabaseReference!
    var fir: Firestore!
    
    var arrayImage = ""
    let userUid = Auth.auth().currentUser!.uid
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        fir = Firestore.firestore()
        print(arrayImage)
        
    }
    
   
    func saveFirData() {
        self.uplodeImage(self.ImageForUpload.image!) { url in
            self.saveImage(profileImageUrl: url!) { success in
                if success != nil {
                    print("yrsg")
                }
            }
        }
        
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        let nav = storyboard?.instantiateViewController(identifier: "mainView") as! mainView
        
        navigationController?.pushViewController(nav, animated: true)
        
        saveFirData()
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
    
    func uplodeImage(_ image:UIImage,complition:@escaping((_ url:URL?)->())){
            let storageRef = Storage.storage().reference().child("UserImages.png")
            let imageData = ImageForUpload.image?.pngData()
            let metaData = StorageMetadata()
            metaData.contentType = "image/png"
    
            storageRef.putData(imageData!,metadata: metaData) { metaData, error in
                if error == nil{
                    print("Success")
                    storageRef.downloadURL {[self] url, error in
                        complition(url)
                        
                        
                    }
                }
                else{
                    print("Error !")
                }
            }
        }
    
    func saveImage(profileImageUrl:URL,complition:@escaping((_ url:URL?)->())){
        let userUid = Auth.auth().currentUser!.uid
        
        
       self.fir.collection("Post").document(userUid).parent.addDocument(data: ["Post":profileImageUrl.absoluteString])
        
//        ref.child("userPost").child(userUid).au.setValue(["url" : profileImageUrl.absoluteString])
    }
    
    
    
}
