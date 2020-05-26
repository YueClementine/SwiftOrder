//
//  DBInit.swift
//  orderSystem
//
//  Created by 岳小葵 on 24/05/2020.
//  Copyright © 2020 岳小葵. All rights reserved.
//

import Foundation
import UIKit

class DatabaseManager
{
    static func DatabaseManager()
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
       let restaurant1 = "INSERT INTO restaurants(restName) VALUES('珞珈面馆');"
           let restaurant2 = "INSERT INTO restaurants(restName) VALUES('信部一食堂');"
           let restaurant3 = "INSERT INTO restaurants(restName) VALUES('工部清真食堂');"
           let restaurant4 = "INSERT INTO restaurants(restName) VALUES('桂圆餐厅');"
           let restaurant5 = "INSERT INTO restaurants(restName) VALUES('海底捞');"
           let restaurant6 = "INSERT INTO restaurants(restName) VALUES('沙县小吃');"
           let restaurant7 = "INSERT INTO restaurants(restName) VALUES('汉堡王');"
           
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
        
        let dish1 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('珞珈面馆','海带豆腐面', 4,'豆腐是最能补钙而且易于人体吸收的食品，还有海带，能够美容养颜，常吃对身体很好，于是心血来潮，就泡了许多海带，做了一个这样的海带豆腐汤，感觉汤品中的海带还是挺好吃的，软糯。还有，豆腐只要炒过的，再放入汤里，味道就特别鲜美了，挺好吃的汤面。');"
        let dish2 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('珞珈面馆','襄阳牛肉面', 16,'襄阳特色牛肉面，牛杂面，牛油面是襄阳人最喜欢的早餐，它特点是这一辣二麻三鲜，味道可口，回味悠长，久食不厌。吃牛肉面时，再喝一碗襄阳黄酒或是襄北豆奶，惬意而舒服。');"
        let dish3 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('珞珈面馆','豌杂面', 10,'豌杂面归属于重庆面的一种，是重庆的一种地方特色小吃，以豌豆与杂酱为主料，配以葱姜蒜为辅料制作而成，口感润滑，豌豆的软糯与面条的劲道以及杂酱的香甜，令人回味无穷。');"

        
        let dish4 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('信部一食堂','烤鱼', 20,'烤鱼，一种发源于重庆巫溪县，而发扬于万州的特色美食，在流传过程中，融合腌、烤、炖三种烹饪工艺技术，充分借鉴传统渝菜及重庆火锅用料特点，是口味奇绝、营养丰富的风味小吃。');"
        let dish5 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('信部一食堂','麻辣小龙虾', 25,'麻辣小龙虾以小龙虾为主材，配以辣椒、花椒和其他香辛料制成。成菜后，色泽红亮，口味辣并鲜香。');"
        let dish6 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('信部一食堂','牛肉干锅', 35,'制作原料主要有牛肉、尖红、精盐、味精等。色红亮，质软糯，汁浓稠，回味悠长，营养丰富。');"
        
        let dish7 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('工部清真食堂','大盘鸡', 30,'主要用料为鸡块和土豆块、四川粉皮，配皮带面烹饪而成。 色彩鲜艳、爽滑麻辣的鸡肉和软糯甜润的土豆，辣中有香、粗中带细，是餐桌上的佳品。');"
        let dish8 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('工部清真食堂','牛肉拉面', 24,'中国城乡独具地方风味的一种传统面食');"
        let dish9 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('工部清真食堂','羊肉抓饭', 24,'手抓饭是中亚、西亚地区的菜品，维吾尔语称坡罗（polo）波斯语称帕劳（palaw），土耳其语称皮拉乌（pilav），在我国新疆主要流传于维吾尔、哈萨克、土克曼、乌兹别克等民族中。');"
        
        let dish10 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('桂圆餐厅','印度飞饼', 60,'“印度飞饼”是一种名小吃，是用调和好的面粉在空中用“飞”的绝技做成，它具有美味可口、浓郁香酥的特点。飞饼（又名印度薄饼），是印度的特色风味美食，其制法用料讲究，特别适合广东人的口味。色、香、味俱全。');"
        let dish11 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('桂圆餐厅','石锅拌饭', 32,'它的发源地为韩国全罗北道，后来演变为朝鲜半岛的代表性食物。是朝鲜半岛三大名菜');"
        let dish12 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('桂圆餐厅','铁板炒饭', 27,'铁板炒饭因粒粒松散、碎金闪烁、鲜美可口而著称，辅以火腿、虾仁、鸡蛋等配菜加上独特的工艺配料，绝对是汉堡王饮食中的佳品。');"
        
        let dish13 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('海底捞','番茄锅', 107,'番茄锅底,跟平时喝的番茄汤,或者拌面的茄汁相比,最大的特点,就是——浓! ');"
        let dish14 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('海底捞','麻辣锅', 146,'重庆麻辣火锅起源自明末清初，四川火锅起源稍晚，在道光年间。当时重庆的筵席已有毛肚火锅。');"
        let dish15 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('海底捞','菌菇锅', 138,'菌菇汤又称干贝杂菇汤，制作简便，容易学会，而且口味好');"
        
        let dish16 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('沙县小吃','葱油面', 15,'葱油面（葱油拌面）是特色传统面食，是苏沪地方非常著名的小吃。');"
        let dish17 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('沙县小吃','鸡腿饭', 39,'鸡腿很大，酱汁浓郁');"
        let dish18 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('沙县小吃','螺蛳粉', 10,'香辣无比，经济实惠');"
        
        let dish19 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('汉堡王','汉堡', 22,'餐包、生菜，番茄、芝士片，肉饼');"
        let dish20 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('汉堡王','炸鸡', 36,'精选全鸡腌制12小时以上');"
        let dish21 = "INSERT OR REPLACE INTO dishDB(restName,dishName,price,detail) VALUES('汉堡王','薯条', 16,'金黄、酥脆可口');"
        
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
        ImageManager.SaveImage(id: 1, img: image1)
        
        let image2 = UIImage(named: "2")
        ImageManager.SaveImage(id: 2, img: image2)
        
        let image3 = UIImage(named: "3")
        ImageManager.SaveImage(id: 3, img: image3)
        
        let image4 = UIImage(named: "4")
        ImageManager.SaveImage(id: 4, img: image4)
        
        let image5 = UIImage(named: "5")
        ImageManager.SaveImage(id: 5, img: image5)
        
        let image6 = UIImage(named: "6")
        ImageManager.SaveImage(id: 6, img: image6)
        
        let image7 = UIImage(named: "7")
        ImageManager.SaveImage(id: 7, img: image7)
        
        let image8 = UIImage(named: "8")
        ImageManager.SaveImage(id: 8, img: image8)
        
        let image9 = UIImage(named: "9")
        ImageManager.SaveImage(id: 9, img: image9)
        
        let image10 = UIImage(named: "10")
        ImageManager.SaveImage(id: 10, img: image10)
        
        let image11 = UIImage(named: "11")
        ImageManager.SaveImage(id: 11, img: image11)
        
        let image12 = UIImage(named: "12")
        ImageManager.SaveImage(id: 12, img: image12)
        
        let image13 = UIImage(named: "13")
        ImageManager.SaveImage(id: 13, img: image13)
        
        let image14 = UIImage(named: "14")
        ImageManager.SaveImage(id: 14, img: image14)
        
        let image15 = UIImage(named: "15")
        ImageManager.SaveImage(id: 15, img: image15)
        
        let image16 = UIImage(named: "16")
        ImageManager.SaveImage(id: 16, img: image16)
        
        let image17 = UIImage(named: "17")
        ImageManager.SaveImage(id: 17, img: image17)
        
        let image18 = UIImage(named: "18")
        ImageManager.SaveImage(id: 18, img: image18)
        
        let image19 = UIImage(named: "19")
        ImageManager.SaveImage(id: 19, img: image19)
        
        let image20 = UIImage(named: "20")
        ImageManager.SaveImage(id: 20, img: image20)
        
        let image21 = UIImage(named: "21")
        ImageManager.SaveImage(id: 21, img: image21)
        

        
        //let result = sqlite.execQuerySQL(sql:"SELECT * FROM dishDB")
        //print(result!)
        
        sqlite.closeDB()
    }
}
