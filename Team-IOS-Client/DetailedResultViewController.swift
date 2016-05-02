//
//  DetailedResultViewController.swift
//  Team-IOS-Client
//
//  Created by fangjia li on 4/30/16.
//  Copyright © 2016 张仁龙. All rights reserved.
//

import UIKit

class DetailedResultViewController: UIViewController, UIScrollViewDelegate {
    var detailedResult:NSDictionary=[:]

    @IBOutlet weak var scrollImg: UIScrollView!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var brief: UILabel!
    @IBOutlet weak var headIcon: UIImageView!
    @IBOutlet weak var rooms: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var dscrption: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(detailedResult)
        let tmp_street = detailedResult["street"] as! String
        let tmp_city = detailedResult["city"]as! String
        let tmp_state = detailedResult["state"]as! String
        let tmp_zipcode = detailedResult["zipcode"]as! String
        let tmp_address = tmp_street + ", " + tmp_city + " " + tmp_state + " " + tmp_zipcode
        address.text = tmp_address
        brief.text = detailedResult["brief"] as? String
        rooms.text = detailedResult["rooms"] as? String
        price.text = detailedResult["price"] as? String
        dscrption.text = detailedResult["description"] as? String
        phone.text = detailedResult["phone"] as? String
        email.text = detailedResult["email"] as? String
        
    }

}
