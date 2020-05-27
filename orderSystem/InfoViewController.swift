//
//  InfoViewController.swift
//  orderSystem
//
//  Created by 岳小葵 on 27/05/2020.
//  Copyright © 2020 WHU. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var photo: UIImageView!
    override func viewDidLoad() {
       
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.opendDB() {return}
        let data = sqlite.execQuerySQL(sql: "select * from information where Name = '" + "岳兵" + "';")
        name.text = "姓名：岳兵"
        id.text = "学号：2018302080386"
        photo.image = UIImage(named: "岳兵")
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
