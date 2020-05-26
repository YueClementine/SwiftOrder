//
//  RestTableViewController.swift
//  orderSystem
//
//  Created by 岳小葵 on 24/05/2020.
//  Copyright © 2020 岳小葵. All rights reserved.
//

import UIKit

class RestTableViewController: UITableViewController {

    override func viewDidLoad() {
        DatabaseManager.DatabaseManager()
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        let data = sqlite.execQuerySQL(sql: "SELECT * FROM restaurants")
        print(data as Any)
        sqlite.closeDB()
        return data!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restCell", for: indexPath)
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.opendDB() {return cell}
        let data = sqlite.execQuerySQL(sql: "select * from restaurants")
        cell.textLabel?.text = data?[indexPath.row]["restName"] as? String
        sqlite.closeDB()

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RestToDish"
            {
                let vc1 = segue.destination as! UINavigationController
                let vc2 = vc1.viewControllers.first as! DishTableViewController
                
                let sqlite = SQLiteManager.sharedInstance
                if !sqlite.opendDB() {return}
                
                let selectRow = tableView.indexPathForSelectedRow!.row
                let data = sqlite.execQuerySQL(sql: "select * from restaurants")
                vc2.selectRstName = data?[selectRow]["restName"] as! String
                print("selceRow:")
                    print(selectRow)
                sqlite.closeDB()
            }
        }
    }
    
