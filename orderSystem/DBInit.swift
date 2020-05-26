//
//  DBInit.swift
//  orderSystem
//
//  Created by 岳小葵 on 24/05/2020.
//  Copyright © 2020 岳小葵. All rights reserved.
//

import Foundation
import UIKit

class DBInit
{
    static func DBInit()
    {
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.opendDB() {return}
        
        //餐厅数据库
        let createSQL = "CREATE TABLE IF NOT EXISTS restaurants('id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, " + "'restName' TEXT ,  'picture' BLOB );"
              if !sqlite.execNoneQuerySQL(sql: createSQL)
              {
                  sqlite.closeDB();
                  return
              }
       let restaurant1 = "INSERT INTO restaurants(restName) VALUES('面馆');"
           let restaurant2 = "INSERT INTO restaurants(restName) VALUES('火锅');"
           let restaurant3 = "INSERT INTO restaurants(restName) VALUES('粤菜');"
           let restaurant4 = "INSERT INTO restaurants(restName) VALUES('西餐');"
           let restaurant5 = "INSERT INTO restaurants(restName) VALUES('日料');"
           let restaurant6 = "INSERT INTO restaurants(restName) VALUES('甜品');"
           let restaurant7 = "INSERT INTO restaurants(restName) VALUES('快餐');"
           
           if !sqlite.execNoneQuerySQL(sql: restaurant1)
           {
               sqlite.closeDB();
               return
           }
           if !sqlite.execNoneQuerySQL(sql: restaurant2)
           {
               sqlite.closeDB();
               return
           }
           if !sqlite.execNoneQuerySQL(sql: restaurant3)
           {
               sqlite.closeDB();
               return
           }
           if !sqlite.execNoneQuerySQL(sql: restaurant4)
           {
               sqlite.closeDB();
               return
           }
           if !sqlite.execNoneQuerySQL(sql: restaurant5)
           {
               sqlite.closeDB();
               return
           }
           if !sqlite.execNoneQuerySQL(sql: restaurant6)
           {
               sqlite.closeDB();
               return
           }
           if !sqlite.execNoneQuerySQL(sql: restaurant7)
           {
               sqlite.closeDB();
               return
           }
        if !sqlite.execNoneQuerySQL(sql: "DELETE FROM restaurants")
        {sqlite.closeDB();return}
        if !sqlite.execNoneQuerySQL(sql: "DELETE FROM sqlite_sequence WHERE name = 'restaurants';")
        {sqlite.closeDB() ; return }
        
    
        if !sqlite.execNoneQuerySQL(sql: createSQL)
        {
            sqlite.closeDB();
            return
        }
       
        
        if !sqlite.execNoneQuerySQL(sql: restaurant1)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: restaurant2)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: restaurant3)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: restaurant4)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: restaurant5)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: restaurant6)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: restaurant7)
        {
            sqlite.closeDB();
            return
        }
        //订单数据库
        
     
 
        let createSQL2 = "CREATE TABLE IF NOT EXISTS orders('id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, " + "'restName' TEXT, 'dishName' TEXT, 'price' INTEGER,'numb' INTEGER ,  'picture' BLOB );"
        if !sqlite.execNoneQuerySQL(sql: createSQL2)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: "DELETE FROM orders")
             {sqlite.closeDB();return}

             if !sqlite.execNoneQuerySQL(sql: "DELETE FROM sqlite_sequence WHERE name = 'orders';")
             {sqlite.closeDB();}
       
        if !sqlite.execNoneQuerySQL(sql: createSQL2)
        {
            sqlite.closeDB();
            return
        }
        // let result = sqlite.execQuerySQL(sql: "SELECT * FROM restaurants")
        // print(result!)
        
        //菜品数据库
        
     
         
        let createSQL3 = "CREATE TABLE IF NOT EXISTS dishDB('id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, " + "'restName' TEXT , 'dishName' TEXT , 'price' INTEGER , 'detail' TEXT , 'picture' BLOB );"
        if !sqlite.execNoneQuerySQL(sql: createSQL3)
        {
            sqlite.closeDB();
            return
        }
        
        let dish1 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('面馆','热干面', 4,'手工面、芝麻酱、红油，萝卜丁');"
        let dish2 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('面馆','炸酱面', 6,'手工面、肉酱');"
        let dish3 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('面馆','牛肉面', 10,'手工面、牛肉');"

        
        let dish4 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('火锅','番茄汤底', 20,'番茄，洋葱');"
        let dish5 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('火锅','肥牛', 25,'冰鲜现切');"
        let dish6 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('火锅','娃娃菜', 15,'高山小种精选');"
        
        let dish7 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('粤菜','虾饺', 22,'水晶虾饺，整虾');"
        let dish8 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('粤菜','烧腊三拼', 54,'叉烧、烧鸭、烧鹅');"
        let dish9 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('粤菜','干炒牛河', 24,'正宗广式牛河');"
        
        let dish10 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('西餐','牛排', 60,'M9和牛');"
        let dish11 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('西餐','松茸蘑菇汤', 32,'奶油浓汤');"
        let dish12 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('西餐','俄式列巴', 27,'麦香回味');"
        
        let dish13 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('日料','刺身拼盘', 107,'三文鱼、甜虾，北极贝');"
        let dish14 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('日料','火炙鳗鱼寿司', 46,'纯手工');"
        let dish15 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('日料','地狱豚骨拉面', 38,'溏心蛋、极辣');"
        
        let dish16 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('甜品','提拉米苏', 45,'手指饼干，马斯卡彭');"
        let dish17 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('甜品','榴莲千层', 39,'榴莲、奶油，千层饼皮');"
        let dish18 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('甜品','芒果慕斯', 30,'淡奶油、芒果，吉利丁');"
        
        let dish19 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('快餐','汉堡', 22,'餐包、生菜，番茄、芝士片，肉饼');"
        let dish20 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('快餐','炸鸡', 36,'精选全鸡腌制12小时以上');"
        let dish21 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('快餐','披萨', 79,'自熬番茄酱、马苏里拉芝士');"
        
        if !sqlite.execNoneQuerySQL(sql: dish1)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: dish2)
        {
            sqlite.closeDB();
            return
        }
        
        if !sqlite.execNoneQuerySQL(sql: dish3)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: dish4)
        {
            sqlite.closeDB();
            return
        }
        
        if !sqlite.execNoneQuerySQL(sql: dish5)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: dish6)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: dish7)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: dish8)
        {
            sqlite.closeDB();
            return
        }
        
        if !sqlite.execNoneQuerySQL(sql: dish9)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: dish10)
        {
            sqlite.closeDB();
            return
        }
        
        if !sqlite.execNoneQuerySQL(sql: dish11)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: dish12)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: dish13)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: dish14)
        {
            sqlite.closeDB();
            return
        }
        
        if !sqlite.execNoneQuerySQL(sql: dish15)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: dish16)
        {
            sqlite.closeDB();
            return
        }
        
        if !sqlite.execNoneQuerySQL(sql: dish17)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: dish18)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: dish19)
        {
            sqlite.closeDB();
            return
        }
        
        if !sqlite.execNoneQuerySQL(sql: dish20)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: dish21)
        {
            sqlite.closeDB();
            return
        }
        if !sqlite.execNoneQuerySQL(sql: "DELETE FROM dishDB")
             {sqlite.closeDB();return}
             if !sqlite.execNoneQuerySQL(sql: "DELETE FROM sqlite_sequence WHERE name = 'dishDB';")
             {sqlite.closeDB() ; return }
        if !sqlite.execNoneQuerySQL(sql: createSQL3)
             {
                 sqlite.closeDB();
                 return
             }
        if !sqlite.execNoneQuerySQL(sql: dish1)
              {
                  sqlite.closeDB();
                  return
              }
              if !sqlite.execNoneQuerySQL(sql: dish2)
              {
                  sqlite.closeDB();
                  return
              }
              
              if !sqlite.execNoneQuerySQL(sql: dish3)
              {
                  sqlite.closeDB();
                  return
              }
              if !sqlite.execNoneQuerySQL(sql: dish4)
              {
                  sqlite.closeDB();
                  return
              }
              
              if !sqlite.execNoneQuerySQL(sql: dish5)
              {
                  sqlite.closeDB();
                  return
              }
              if !sqlite.execNoneQuerySQL(sql: dish6)
              {
                  sqlite.closeDB();
                  return
              }
              if !sqlite.execNoneQuerySQL(sql: dish7)
              {
                  sqlite.closeDB();
                  return
              }
              if !sqlite.execNoneQuerySQL(sql: dish8)
              {
                  sqlite.closeDB();
                  return
              }
              
              if !sqlite.execNoneQuerySQL(sql: dish9)
              {
                  sqlite.closeDB();
                  return
              }
              if !sqlite.execNoneQuerySQL(sql: dish10)
              {
                  sqlite.closeDB();
                  return
              }
              
              if !sqlite.execNoneQuerySQL(sql: dish11)
              {
                  sqlite.closeDB();
                  return
              }
              if !sqlite.execNoneQuerySQL(sql: dish12)
              {
                  sqlite.closeDB();
                  return
              }
              if !sqlite.execNoneQuerySQL(sql: dish13)
              {
                  sqlite.closeDB();
                  return
              }
              if !sqlite.execNoneQuerySQL(sql: dish14)
              {
                  sqlite.closeDB();
                  return
              }
              
              if !sqlite.execNoneQuerySQL(sql: dish15)
              {
                  sqlite.closeDB();
                  return
              }
              if !sqlite.execNoneQuerySQL(sql: dish16)
              {
                  sqlite.closeDB();
                  return
              }
              
              if !sqlite.execNoneQuerySQL(sql: dish17)
              {
                  sqlite.closeDB();
                  return
              }
              if !sqlite.execNoneQuerySQL(sql: dish18)
              {
                  sqlite.closeDB();
                  return
              }
              if !sqlite.execNoneQuerySQL(sql: dish19)
              {
                  sqlite.closeDB();
                  return
              }
              
              if !sqlite.execNoneQuerySQL(sql: dish20)
              {
                  sqlite.closeDB();
                  return
              }
              if !sqlite.execNoneQuerySQL(sql: dish21)
              {
                  sqlite.closeDB();
                  return
              }
        //添加图片
        let image1 = UIImage(named: "1")
        ImageDal.SaveImage(id: 1, img: image1)
        
        let image2 = UIImage(named: "2")
        ImageDal.SaveImage(id: 2, img: image2)
        
        let image3 = UIImage(named: "3")
        ImageDal.SaveImage(id: 3, img: image3)
        
        let image4 = UIImage(named: "4")
        ImageDal.SaveImage(id: 4, img: image4)
        
        let image5 = UIImage(named: "5")
        ImageDal.SaveImage(id: 5, img: image5)
        
        let image6 = UIImage(named: "6")
        ImageDal.SaveImage(id: 6, img: image6)
        
        let image7 = UIImage(named: "7")
        ImageDal.SaveImage(id: 7, img: image7)
        
        let image8 = UIImage(named: "8")
        ImageDal.SaveImage(id: 8, img: image8)
        
        let image9 = UIImage(named: "9")
        ImageDal.SaveImage(id: 9, img: image9)
        
        let image10 = UIImage(named: "10")
        ImageDal.SaveImage(id: 10, img: image10)
        
        let image11 = UIImage(named: "11")
        ImageDal.SaveImage(id: 11, img: image11)
        
        let image12 = UIImage(named: "12")
        ImageDal.SaveImage(id: 12, img: image12)
        
        let image13 = UIImage(named: "13")
        ImageDal.SaveImage(id: 13, img: image13)
        
        let image14 = UIImage(named: "14")
        ImageDal.SaveImage(id: 14, img: image14)
        
        let image15 = UIImage(named: "15")
        ImageDal.SaveImage(id: 15, img: image15)
        
        let image16 = UIImage(named: "16")
        ImageDal.SaveImage(id: 16, img: image16)
        
        let image17 = UIImage(named: "17")
        ImageDal.SaveImage(id: 17, img: image17)
        
        let image18 = UIImage(named: "18")
        ImageDal.SaveImage(id: 18, img: image18)
        
        let image19 = UIImage(named: "19")
        ImageDal.SaveImage(id: 19, img: image19)
        
        let image20 = UIImage(named: "20")
        ImageDal.SaveImage(id: 20, img: image20)
        
        let image21 = UIImage(named: "21")
        ImageDal.SaveImage(id: 21, img: image21)
        

        
        //let result = sqlite.execQuerySQL(sql:"SELECT * FROM dishDB")
        //print(result!)
        
        sqlite.closeDB()
    }
}
