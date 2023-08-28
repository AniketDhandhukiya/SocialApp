//
//  searchPage.swift
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

struct GetPosts {
    var Post : String
}

class searchPage: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var cvForSearch: UICollectionView!
    var colRef : CollectionReference!
    var userUid = Auth.auth().currentUser!.uid
    var arrayForPosts = [GetPosts]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayForPosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cvForSearch.dequeueReusableCell(withReuseIdentifier: "cellForSearch", for: indexPath) as! CollectionViewCellForSearch
        cell.imageForPost.sd_setImage(with: URL(string: arrayForPosts[indexPath.row].Post))
        print(arrayForPosts[indexPath.row].Post)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 101, height: 102)
    }
    
    func getData() {
        colRef = Firestore.firestore().collection("Post")
        colRef.addSnapshotListener() { [self] docuSnapshot, error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }
            else{
                arrayForPosts = docuSnapshot!.documents.map { document in
                    return GetPosts(Post: document["Post"] as! String)
            
                }
                print(arrayForPosts)
                collectionView.reloadData()
            }
        }
    }
}
