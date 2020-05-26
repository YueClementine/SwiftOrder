//
//  OrderTableViewController.swift
//  orderSystem
//
//  Created by 岳小葵 on 24/05/2020.
//  Copyright © 2020 岳小葵. All rights reserved.
//
import UIKit
protocol AddOrderDelegate {
    func addOrder(restName:String,dishName:String,price:Int,num:Int)
}


class OrderTableViewController: UITableViewController,AddOrderDelegate {
    
    func addOrder(restName: String, dishName: String, price: Int, num: Int)
       {
           let sqlite = SQLiteManager.sharedInstance
           if !sqlite.opendDB() {return}
           let addsql = "INSERT INTO orders (restName,dishName,price,numb) VALUES('"+restName+"','"+dishName+"',\(price),\(num));"
           
           
           if !sqlite.execNoneQuerySQL(sql: addsql)
           {
               sqlite.closeDB();
               return
           }
           //   let result = sqlite.execQuerySQL(sql: "SELECT * FROM orders")
           //   print(result!)
           //   print("添加成功")
           sqlite.closeDB()
       }
       

    override func viewDidLoad() {
        let xib = UINib(nibName: "OrderTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "OrderCell")
        tableView.rowHeight = 110
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func sumup(_ sender: Any) {
           let sqlite = SQLiteManager.sharedInstance
           if !sqlite.opendDB() {return}
           let data = sqlite.execQuerySQL(sql: "select * from orders")
           var totalPrice:Int = 0
           let num = data?.count as! Int
           if(num>0){
           for i in 0...num-1{
               var price = data?[i]["price"] as! Int
               var numb = data?[i]["numb"] as! Int
              totalPrice = totalPrice + price*numb
           }
           }
           let alert = UIAlertController(title: "总价:\(totalPrice)", message: "确定下单？", preferredStyle: .alert)
           let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
           let okAction = UIAlertAction(title: "好的", style: .default, handler: {(UIAlertAction)in
               print(totalPrice)
            
        
            
            
            let sqlite = SQLiteManager.sharedInstance
               if !sqlite.opendDB() {return}
               if !sqlite.execNoneQuerySQL(sql: "DELETE FROM orders")
               {sqlite.closeDB();return}
               if !sqlite.execNoneQuerySQL(sql: "DELETE FROM sqlite_sequence WHERE name = 'orders';")
               {sqlite.closeDB() ; return }
               self.tableView.reloadData()
               
            
            
            let storyboard:UIStoryboard! = UIStoryboard(name: "Main", bundle: nil)
            
            let welcome = storyboard!.instantiateViewController(withIdentifier: "Welcome")
            self.present(welcome, animated: true, completion: nil)
           
            let vc = storyboard!.instantiateViewController(withIdentifier: "TabView")
            UIApplication.shared.windows[0].rootViewController = vc

               
           })
           alert.addAction(okAction)
           alert.addAction(cancelAction)

           present(alert,animated: true,completion: nil)
           sqlite.closeDB()
       }
    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.opendDB() {return 0}
        let data = sqlite.execQuerySQL(sql: "SELECT * FROM orders")
        return data!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath)as! OrderTableViewCell
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.opendDB() {return cell}
        let data = sqlite.execQuerySQL(sql: "select * from orders")
        if(data!.count>0){
        
         
        cell.restName?.text = data?[indexPath.row]["restName"] as? String
            cell.numb?.text = data?[indexPath.row]["numb"]?.stringValue
            let a = data?[indexPath.row]["price"]?.stringValue
            cell.price?.text = "单价"+a!
        cell.dishName?.text = data?[indexPath.row]["dishName"] as? String
 }

        print(cell)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let selectRow = indexPath.row
            print(selectRow)
            let sqlite = SQLiteManager.sharedInstance
            if !sqlite.opendDB() {return}
            
            if !sqlite.execNoneQuerySQL(sql: "DELETE FROM orders WHERE id = " + "\(selectRow)")
            {sqlite.closeDB();return}
            sqlite.closeDB()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
             
        }else if editingStyle == .insert {
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
