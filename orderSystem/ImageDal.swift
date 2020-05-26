//
//  ImageDal.swift
//  Restaurant
//  orderSystem
//
//  Created by 岳小葵 on 24/05/2020.
//  Copyright © 2020 岳小葵. All rights reserved.
//

import Foundation
import UIKit

class ImageDal{
    static func SaveImage(id:Int,img:UIImage?)
    {
        if img == nil {return}
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.opendDB(){return}
        let sql = "UPDATE dishDB SET picture = ? WHERE id = \(id)"
        let data = img!.jpegData(compressionQuality: 1.0) as NSData?
        sqlite.execSaveBlob(sql: sql, blob: data!)
        sqlite.closeDB()
        return
    }
    
    static func LoadImage(id:Int) -> UIImage
    {
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.opendDB(){return UIImage(named: "first")!}
        let sql = "SELECT picture from dishDB WHERE id = \(id)"
        let data = sqlite.exeLoadBlob(sql: sql)
        sqlite.closeDB()
        if data != nil{
            return UIImage(data: data!)!
        }
        else
        {
            return  UIImage(named: "first")!
        }
        
    }
}
