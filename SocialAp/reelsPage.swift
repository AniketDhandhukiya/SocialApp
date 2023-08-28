//
//  reelsPage.swift
//  SocialAp
//
//  Created by R87 on 17/08/23.
//

import UIKit

class reelsPage: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
   

    @IBOutlet weak var cvForReels: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cvForReels.dequeueReusableCell(withReuseIdentifier: "cellForReels", for: indexPath) as! CollectionViewCellForReels
        return cell
    }
    
}
