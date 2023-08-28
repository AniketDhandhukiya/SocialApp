//
//  SettingPage.swift
//  SocialAp
//
//  Created by Sneh Kalariya on 18/08/23.
//

import UIKit

class SettingPage: UIViewController {
    
    var imageName = [UIImage (named: "Follow"), UIImage (named: "Notifications"), UIImage (named:
    "Creator"), UIImage (named: "Privacy"), UIImage (named: "Payments"), UIImage (named:
    "Security"), UIImage (named: "Ads"), UIImage (named: "user") , UIImage (named:
    "Help"), UIImage (named: "About"), UIImage (named: "Theme" )]
    
    var labelName = ["Follow and invitefriends", "Notifications" , "Creator", "Privacy", "Payments", "Security", "Ads", "Accounts" , "Help", "About", "Theme"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension SettingPage : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SettingPageCell
        cell.iconImage.image = imageName[indexPath.row]
        cell.nameLabel.text = labelName[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 389, height: 60)
    }
    
}
