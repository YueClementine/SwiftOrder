//
//  AboutAppViewController.swift
//  orderSystem
//
//  Created by 岳小葵 on 27/05/2020.
//  Copyright © 2020 WHU. All rights reserved.
//

import UIKit

class AboutAppViewController: UIViewController {

    @IBOutlet weak var About: UILabel!
    override func viewDidLoad() {
        About.text = "开发这个项目的时候，遇到了很多课上没有讲到的问题。经过数周的debug，看书，以及在网络上进行查询和学习。终于完成了任务要求的功能开发。在这个过程中积累了许多宝贵的经验，尤其是sqlite数据库的使用。"
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
