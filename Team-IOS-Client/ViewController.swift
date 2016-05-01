//
//  ViewController.swift
//  Team-IOS-Client
//
//  Created by 张仁龙 on 4/21/16.
//  Copyright © 2016 张仁龙. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBOutlet weak var locationTxt: UITextField!
    @IBOutlet weak var locationBtn: UIButton!
    
    @IBOutlet weak var searchHistoryTable: UITableView!
    @IBOutlet weak var propertyBtn: UIButton!
    var searchHistory = [String]()
    var viaPropertyType = ""
    var viaSearchTxt=""
    var viaLocationTxt=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchHistoryTable.hidden = true
        self.searchHistoryTable.delegate = self
        self.searchHistoryTable.dataSource = self
        self.searchHistoryTable.registerClass(UITableViewCell.self,
                                     forCellReuseIdentifier: "historyTable")
        
        
        self.propertyBtn.layer.cornerRadius = 5
        self.propertyBtn.layer.borderWidth = 1
        self.propertyBtn.layer.borderColor = UIColor.blackColor().CGColor
        let selectedProperty = NSUserDefaults.standardUserDefaults().objectForKey("selectedProperty")as? String
        if(selectedProperty?.isEmpty == false){
            viaPropertyType = selectedProperty!
            NSUserDefaults.standardUserDefaults().removeObjectForKey("selectedProperty")
        }
        self.propertyBtn.setTitle(viaPropertyType, forState: .Normal)
        
        self.searchTxt.layer.cornerRadius = 5
        self.searchTxt.layer.borderWidth = 1
        self.searchTxt.layer.borderColor = UIColor(red: 0.0/255, green: 127.0/255, blue: 248.0/255, alpha: 1.0).CGColor
        let savedSearchTxt = NSUserDefaults.standardUserDefaults().objectForKey("savedSearchTxt")as? String
        if(savedSearchTxt?.isEmpty == false){
            self.searchTxt.text = savedSearchTxt
            viaSearchTxt = savedSearchTxt!
            NSUserDefaults.standardUserDefaults().removeObjectForKey("savedSearchTxt")
            
        }
        self.locationTxt.layer.cornerRadius = 5
        self.locationTxt.layer.borderWidth = 1
        self.locationTxt.layer.borderColor = UIColor(red: 0.0/255, green: 127.0/255, blue: 248.0/255, alpha: 1.0).CGColor
        
        self.searchBtn.layer.cornerRadius = 5
        self.searchBtn.layer.borderWidth = 1
        self.searchBtn.layer.borderColor = UIColor(red: 0.0/255, green: 127.0/255, blue: 248.0/255, alpha: 1.0).CGColor
        
        self.locationBtn.layer.cornerRadius = 5
        
        self.locationTxt.text = viaLocationTxt
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }
        //txtFieldChanged
    @IBAction func clickSearchField(sender: AnyObject) {
        let history = NSUserDefaults.standardUserDefaults().objectForKey("history")as? [String] ?? [String]()
        if(history.isEmpty == false){
            searchHistoryTable.hidden = false
            self.searchHistoryTable.reloadData()
            
        }else{
            searchHistoryTable.hidden = true
        }
       
    }
    @IBAction func editingEnd(sender: AnyObject) {
        viaSearchTxt = self.searchTxt.text!
        NSUserDefaults.standardUserDefaults().setObject(viaSearchTxt, forKey: "savedSearchTxt")
        NSUserDefaults.standardUserDefaults().synchronize()
        searchHistoryTable.hidden = true
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let history = NSUserDefaults.standardUserDefaults().objectForKey("history")as? [String] ?? [String]()
        viaSearchTxt = history[indexPath.row]
        searchTxt.text=viaSearchTxt
        searchHistoryTable.hidden = true
    }
    
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let history = NSUserDefaults.standardUserDefaults().objectForKey("history")as? [String] ?? [String]()
        if(history.isEmpty == false){
            return NSUserDefaults.standardUserDefaults().objectForKey("history")!.count}
        else{
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("historyTable",
                                                               forIndexPath: indexPath) as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        var history = NSUserDefaults.standardUserDefaults().objectForKey("history")as? [String] ?? [String]()
        if(history.isEmpty == false){
            cell.textLabel?.text = history[indexPath.row]
            
        }
        return cell
    }
    //button for remove all search history
    @IBAction func clear(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().removeObjectForKey("history")
       
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "searchResultView") {
            if let destination = segue.destinationViewController as? SearchResultViewController {
                destination.searchTxt = viaSearchTxt
                destination.locationTxt = viaLocationTxt
                destination.propertyType=viaPropertyType
            }
            self.tabBarController?.tabBar.hidden = true
        }
    }
    
    //button click for store the search text
    @IBAction func search(sender: AnyObject) {
        print("search")
        var history = NSUserDefaults.standardUserDefaults().objectForKey("history")as? [String] ?? [String]()
        if(history.isEmpty == false){
            history.append(viaSearchTxt)
            NSUserDefaults.standardUserDefaults().setObject(history, forKey: "history")
            NSUserDefaults.standardUserDefaults().synchronize()
        }else{
            searchHistory.append(viaSearchTxt)
            NSUserDefaults.standardUserDefaults().setObject(searchHistory, forKey: "history")
            NSUserDefaults.standardUserDefaults().synchronize()
            searchHistory.removeAll()
        }
        searchHistoryTable.hidden = true
    }
}

