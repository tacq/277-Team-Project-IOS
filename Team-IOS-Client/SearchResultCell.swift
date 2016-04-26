//
//  SearchResultCell.swift
//  Team-IOS-Client
//
//  Created by fangjia li on 4/25/16.
//  Copyright © 2016 张仁龙. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var property: UILabel!
    @IBOutlet weak var rooms: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var img: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(address: String, property: String, rooms:Int, price:Double, img:String){
        self.address.text = address
        self.property.text = property
        self.rooms.text = String(rooms)
        self.price.text = String(price)
        self.img.image = UIImage(named: img)
    }

}
