//
//  mainView.swift
//  SocialAp
//
//  Created by R87 on 17/08/23.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase
import FirebaseFirestore
import FirebaseAuth
import SDWebImage

struct Data{
    var userImage : String
}

class mainView: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var array = ["e","f"]
    var arr = [Data]()
    var arrayImage = [String]()
    var collRef : CollectionReference!
    @IBOutlet weak var cvForPost: UICollectionView!
    @IBOutlet weak var cvForStory: UICollectionView!
    var ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cvForStory{
            return array.count
            
            
        }
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == cvForStory{
            let cell = cvForStory.dequeueReusableCell(withReuseIdentifier: "cellForStory", for: indexPath) as! CollectionViewCellForStory
           // cell.storyImage.sd_setImage(with: URL(string: arr[indexPath.row].userImage))
            if indexPath.row == 0{
                cell.storyImage.image = UIImage(named: "k")
                cell.storyName.text = "Your Story"
            }else{
                cell.storyImage.image = UIImage(named: "A")
                cell.storyName.text = "aniket"
                cell.storyImage.layer.borderColor = UIColor.systemPink.cgColor
                cell.storyImage.layer.borderWidth = 2
            }
            cell.storyImage.layer.cornerRadius = 40
            return cell
        }
        let cells = cvForPost.dequeueReusableCell(withReuseIdentifier: "cellForPost", for: indexPath) as! CollectionViewCellForPost
        cells.postimage.sd_setImage(with: URL(string: arr[indexPath.row].userImage))
        
        cells.userpostImage.layer.cornerRadius = 20
        return cells
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == cvForStory{
            if indexPath.row == 0{
                
            }
        }
        else{
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == cvForStory{
            return CGSize(width: 99, height: 130)
        }
        return CGSize(width: 392, height: 542)
    }
    
    func getData(){
        collRef = Firestore.firestore().collection("Post")
        collRef.addSnapshotListener() { [self] documentSnapshot, error in
            if error == nil{
                arr = documentSnapshot!.documents.map{ document in
                    return Data(userImage: document["Post"] as! String)
                     }
                cvForPost.reloadData()
                cvForStory.reloadData()
                }
            }
        }
    
//    func getData(){
//        let userID = Auth.auth().currentUser?.uid
//        ref.child("userPost").child(userID!).observeSingleEvent(of: .value, with: { snapshot in
//          // Get user value
//          let value = snapshot.value as? NSDictionary
//          let username = value?["url"] as? String ?? ""
//            let user = Data(userImage: username)
//
//          // ...
//        }) { error in
//          print(error.localizedDescription)
//        }
//    }
//
}
