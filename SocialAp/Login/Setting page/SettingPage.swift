//
//  SettingPage.swift
//  SocialAp
//
//  Created by Sneh Kalariya on 28/08/23.
//

import UIKit
import FirebaseAuth

class SettingPage: UIViewController {
    
    var imageName = [UIImage (named: "Follow"), UIImage (named: "Notifications"), UIImage (named:
    "Creator"), UIImage (named: "Privacy"), UIImage (named: "Payments"), UIImage (named:
    "Security"), UIImage (named: "Ads"), UIImage (named: "user") , UIImage (named:
    "Help"), UIImage (named: "About"), UIImage (named: "userrrr" )]
    
    var nameArray = ["Follow and invitefriends", "Notifications" ,"Creator","Privacy","Payments","Security","Ads","Accounts", "Help","About","Log out"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension SettingPage:
    UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell",for:
        indexPath) as! SettingPageCell
        cell.iconImage.image = imageName [indexPath.row]
        cell.nameLabel.text = nameArray[indexPath.row]
        if indexPath.row == 10{
         cell.nameLabel.textColor = .red
            
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 375, height: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 10{
            print(".....")
            do {
                try Auth.auth().signOut()
                let navigate = storyboard?.instantiateViewController(withIdentifier: "mainPage") as! mainPage
                navigationController?.pushViewController(navigate, animated: true)
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
}
