//
//  SearchResultViewController.swift
//  Team-IOS-Client
//
//  Created by fangjia li on 4/25/16.
//  Copyright © 2016 张仁龙. All rights reserved.
//

import UIKit
import Alamofire

class SearchResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var resultTable: UITableView!
    var arrayOfResult: [Result] = [Result]()
    let cellSpacingHeight: CGFloat = 15
    var searchTxt=""
    var locationTxt=""
    var propertyType=""
    var searchResult:NSArray = []
    var favoriteResult:NSArray = []
    var detailedResult:NSDictionary=[:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Send HTTP POST Request
        Alamofire.request(.POST, "http://localhost:8888/search", parameters: ["username":"hollandlinus@gmail.com","searchTxt": searchTxt,"locationTxt":locationTxt,"propertyType":propertyType])
            .responseJSON { response in switch response.result {
            case .Success(let JSON):
                let response = JSON as! NSDictionary
                self.searchResult = response["value"] as! NSArray
                self.favoriteResult = response["favorite"] as! NSArray
                self.setUpResults()
                self.resultTable.reloadData()
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
                }
        }
        self.resultTable.backgroundView = UIImageView(image: UIImage(named: "background_img"))
        self.resultTable.tableFooterView = UIView()
    }
    
    //set cell number
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfResult.count
    }
    
    //set cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: SearchResultCell = tableView.dequeueReusableCellWithIdentifier("resultCell") as! SearchResultCell
        let result = arrayOfResult[indexPath.row]
        cell.setCell(result.address, property: result.property, rooms: result.rooms, price: result.price, img: result.img)
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        detailedResult = searchResult[indexPath.row] as! NSDictionary
        performSegueWithIdentifier("detailedResultSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailedResultSegue" {
            if let destination = segue.destinationViewController as? DetailedResultViewController {
                destination.detailedResult = detailedResult
                for favorite_id in favoriteResult{
                    if(favorite_id as! String == detailedResult["id"] as! String){
                        print("yes")
                        destination.favorited = 1
                        break
                    }
                }
            }
        }
    }
    func setUpResults(){
        let dataArray = searchResult
        for value in dataArray as![[String:String]]{
            let address = value["street"]!+", "+value["city"]!+" "+value["state"]!+" "+value["zipcode"]!
            let result = Result(address: address, property: value["property"]!, rooms: Int(value["rooms"]!)!, price: Double(value["price"]!)!, img: "")
            arrayOfResult.append(result)
        }
    }
    
    
}
