//
//  captionPost.swift
//  SocialAp
//
//  Created by R87 on 28/08/23.
//

import UIKit

class captionPost: UIViewController {

    @IBOutlet weak var imagev: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
  

    @IBAction func shareAction(_ sender: Any) {
        let nav = storyboard?.instantiateViewController(identifier: "NewPost") as! NewPost
        navigationController?.pushViewController(nav, animated: true)
    }
}
