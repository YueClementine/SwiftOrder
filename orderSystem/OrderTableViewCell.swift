//
//  OrderTableViewCell.swift
//  orderSystem
//
//  Created by 岳小葵 on 24/05/2020.
//  Copyright © 2020 岳小葵. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var restName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var numb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
