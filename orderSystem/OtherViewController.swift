//
//  OtherViewController.swift
//  orderSystem
//
//  Created by 岳小葵 on 27/05/2020.
//  Copyright © 2020 WHU. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {

    @IBOutlet weak var a: UIImageView!
    @IBOutlet weak var other: UILabel!
    override func viewDidLoad() {
        other.text = "希师辛苦了！"
        a.image = UIImage(named: "老师辛苦了")
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
