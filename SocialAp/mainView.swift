//
//  mainView.swift
//  SocialAp
//
//  Created by R87 on 17/08/23.
//

import UIKit
struct Data{
    var userImage : String
}

class mainView: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var array = ["e","f"]
    var arr = [Data]()
    @IBOutlet weak var cvForPost: UICollectionView!
    @IBOutlet weak var cvForStory: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == cvForStory{
            let cell = cvForStory.dequeueReusableCell(withReuseIdentifier: "cellForStory", for: indexPath) as! CollectionViewCellForStory
            cell.storyImage.layer.cornerRadius = 40
            if indexPath.row == 0  {
            }
            return cell
        }
        let cells = cvForPost.dequeueReusableCell(withReuseIdentifier: "cellForPost", for: indexPath) as! CollectionViewCellForPost
        return cells
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == cvForStory{
            return CGSize(width: 99, height: 130)
        }
        return CGSize(width: 392, height: 542)
    }
   
   
}






//func uplodeImage(_ image:UIImage,complition:@escaping((_ url:URL?)->())){
//        let storageRef = Storage.storage().reference().child("UserImages.png")
//        let imageData = imageOutlet.image?.pngData()
//        let metaData = StorageMetadata()
//        metaData.contentType = "image/png"
//
//        storageRef.putData(imageData!,metadata: metaData) { metaData, error in
//            if error == nil{
//                print("Success")
//                storageRef.downloadURL { url, error in
//                    complition(url)
//                }
//            }
//            else{
//                print("Error !")
//            }
//        }
//    }
//
//    func saveImage(profileImageUrl:URL,complition:@escaping((_ url:URL?)->())){
//        let directory = ["BirthDate":birthDateTextField.text!,"Username":usertextField.text!,"Name":nameTextField.text!,"Bio":bioTextFiled.text!,"Number":numberTextFiled.text!,"Gender":genderTextFiled.text!,"Email": Auth.auth().currentUser?.email,"ProfileImageUrl":profileImageUrl.absoluteString] as! [String: Any]
//
//        self.fir.collection("UserProfile").document(userUid!).setData(directory)
//
//    }
//func saveFirData() {
//       self.uplodeImage(self.imageOutlet.image!) { url in
//           self.saveImage(profileImageUrl: url!) { success in
//               if success != nil {
//                   print("Yehh")
//               }
//           }
//       }
