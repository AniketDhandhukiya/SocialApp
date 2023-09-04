//
//  profilePage.swift
//  SocialAp
//
//  Created by R87 on 28/08/23.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseStorage
import SDWebImage
import FirebaseFirestore

struct data {
    var user : String
}

class profilePage: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var bio: UITextView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userName: UIButton!
    @IBOutlet weak var followingLBL: UILabel!
    @IBOutlet weak var followerLbl: UILabel!
    @IBOutlet weak var postLbl: UILabel!
    @IBOutlet weak var mainDp: UIImageView!
    
    @IBOutlet weak var cv: UICollectionView!
    
    var colref : CollectionReference!
    var fir = Firestore.firestore()
    var arrayForPosts = [data]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        mainDp.layer.cornerRadius = 43
        mainDp.layer.masksToBounds = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayForPosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! cellProfilePage
        cell.imggg.sd_setImage(with: URL(string: arrayForPosts[indexPath.row].user))
        postLbl.text = arrayForPosts.count.description
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 118, height: 118)
    }
    
    func getData(){
        let userUid = Auth.auth().currentUser!.uid
        
        
        colref = Firestore.firestore().collection("userProfile")
        colref.addSnapshotListener() { [self] documentSnapshot, error in
            if error == nil{
                for document in documentSnapshot!.documents {
                    if document.documentID == userUid {
                        userName.setTitle(document["userName"] as? String, for: .normal) 
                    }
                }
                
            }
        }
        
       print(userUid)
        colref = Firestore.firestore().collection("Posts")
        colref.addSnapshotListener() {[self] documentSnapshot, error in
            if error == nil{
                arrayForPosts = documentSnapshot!.documents.compactMap({ document in
                    print(document["UserUid"] as! String)
                    if document["UserUid"] as! String == userUid {
                       
                        return data(user: document["Post"] as! String)
                    }
                    return nil
                })
                cv.reloadData()
            }
        }
    }
    
    @IBAction func settiAc(_ sender: Any) {
        let nv = storyboard?.instantiateViewController(withIdentifier: "SettingPage") as! SettingPage
        navigationController?.pushViewController(nv, animated: true)
    }
    
}
