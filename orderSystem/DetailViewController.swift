//
//  DetailViewController.swift
//  orderSystem
//
//  Created by 岳小葵 on 24/05/2020.
//  Copyright © 2020 岳小葵. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
      var addorder : AddOrderDelegate?

      var selectDishName : String!
      var selectRestName: String!
      var selectDetail : String!
      var selectPrice : Int!
      
      @IBOutlet weak var image: UIImageView!
      @IBOutlet weak var dishName: UILabel!
      @IBOutlet weak var restName: UILabel!
      @IBOutlet weak var detail: UILabel!
      @IBOutlet weak var price: UILabel!
      @IBOutlet weak var numb: UILabel!
      @IBOutlet weak var valueStepp: UIStepper!

    override func viewDidLoad() {
            let ordercontro = OrderTableViewController()
            addorder = ordercontro

               
               dishName.text = selectDishName
               restName.text = selectRestName
               detail.text = selectDetail
               price.text = String(selectPrice)
               
               let sqlite = SQLiteManager.sharedInstance
               if !sqlite.opendDB() {return}
               let data = sqlite.execQuerySQL(sql: "select * from dishDB where dishName = '"+selectDishName+"';")
               let selectId = data?.first?["id"]
               image.image = ImageManager.LoadImage(id: selectId as! Int)
               super.viewDidLoad()

    }
    @IBAction func numbStepp(_ sender: Any) {
        numb.text = String(Int(valueStepp.value))
    }
    @IBAction func placeOrderButton(_ sender: Any) {
        addorder?.addOrder(restName: restName.text!, dishName: dishName.text!, price: selectPrice, num: Int(valueStepp.value))
        let mineVC = DishTableViewController()
        var targetVC : UITableViewController!
        for controller in self.navigationController!.viewControllers{
            if controller.isKind(of: mineVC.classForCoder){
                targetVC = controller as! UITableViewController
            }
        }
        if targetVC != nil{
            self.navigationController?.popToViewController(targetVC, animated: true)
        }
        //self.dismiss(animated: true, completion: nil)
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
