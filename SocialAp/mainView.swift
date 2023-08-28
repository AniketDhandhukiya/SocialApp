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
    var collRef : CollectionReference!
    @IBOutlet weak var cvForPost: UICollectionView!
    @IBOutlet weak var cvForStory: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cvForStory{
            return arr.count
            
        }
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == cvForStory{
            let cell = cvForStory.dequeueReusableCell(withReuseIdentifier: "cellForStory", for: indexPath) as! CollectionViewCellForStory
            //cell.storyImage.sd_setImage(with: URL(string: arr[indexPath.row].userImage))
            cell.storyImage.layer.cornerRadius = 40
            return cell
        }
        let cells = cvForPost.dequeueReusableCell(withReuseIdentifier: "cellForPost", for: indexPath) as! CollectionViewCellForPost
        cells.postimage.sd_setImage(with: URL(string: arr[indexPath.row].userImage))
        cells.userpostImage.sd_setImage(with: URL(string: arr[indexPath.row].userImage))
        return cells
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
        
}
