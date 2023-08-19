//
//  mainPage.swift
//  SocialAp
//
//  Created by R87 on 17/08/23.
//

import UIKit

class mainPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func loginAction(_ sender: Any) {
        let nv = storyboard?.instantiateViewController(withIdentifier: "signInPage") as! signInPage
        navigationController?.pushViewController(nv, animated: true)
    }
    @IBAction func CreateAc(_ sender: Any) {
        let nv = storyboard?.instantiateViewController(withIdentifier: "mainPage2") as! mainPage2
        navigationController?.pushViewController(nv, animated: true)
    }
    


}
