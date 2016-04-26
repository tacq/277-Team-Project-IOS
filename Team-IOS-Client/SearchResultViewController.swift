//
//  SearchResultViewController.swift
//  Team-IOS-Client
//
//  Created by fangjia li on 4/25/16.
//  Copyright © 2016 张仁龙. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var resultTable: UITableView!
    var arrayOfResult: [Result] = [Result]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpResults()
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfResult.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: SearchResultCell = tableView.dequeueReusableCellWithIdentifier("resultCell") as! SearchResultCell
        
       //even row is blue color, odd row is gree color
        if indexPath.row % 2 == 0{
            cell.backgroundColor = UIColor.yellowColor()
        }
        else{
            cell.backgroundColor = UIColor.greenColor()
        }
        
        let result = arrayOfResult[indexPath.row]
        cell.setCell(result.address, property: result.property, rooms: result.rooms, price: result.price, img: result.img)
        
        return cell
    }
    
    func setUpResults(){
        let result1 = Result(address: "39370 Civic Center Dr, Fremont CA 94538", property: "Apartment", rooms: 2, price: 2358.06, img: "")
        let result2 = Result(address: "40640 High St, Fremont Ca 94538", property: "Condo", rooms: 3, price: 1800.08, img: "")
        arrayOfResult.append(result1)
        arrayOfResult.append(result2)
    }
    

}
