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
    
    
    @IBOutlet weak var postLbl: UILabel!
    @IBOutlet weak var mainDp: UIImageView!
    
    @IBOutlet weak var cv: UICollectionView!
    
    var colref : CollectionReference!
    var array = [data]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        mainDp.layer.cornerRadius = 43
        mainDp.layer.masksToBounds = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! cellProfilePage
        cell.imggg.sd_setImage(with: URL(string: array[indexPath.row].user))
        postLbl.text = array.count.description
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 118, height: 118)
    }
    
    func getData(){
        colref = Firestore.firestore().collection("Post")
        colref.addSnapshotListener() {[self] documentSnapshot, error in
            if error == nil{
                array = documentSnapshot!.documents.map({ document in
                    return data(user: document["Post"] as! String)
                    
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
