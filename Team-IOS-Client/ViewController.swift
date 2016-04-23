//
//  ViewController.swift
//  Team-IOS-Client
//
//  Created by 张仁龙 on 4/21/16.
//  Copyright © 2016 张仁龙. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var searchHistoryTable: UITableView!
    var searchHistory = [String]()
    TexttoSpeach

    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchHistoryTable.hidden = true
        self.searchHistoryTable.delegate = self
        self.searchHistoryTable.dataSource = self
        self.searchHistoryTable.registerClass(UITableViewCell.self,
                                     forCellReuseIdentifier: "historyTable")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let history = NSUserDefaults.standardUserDefaults().objectForKey("history")as? [String] ?? [String]()
        searchTxt.text=history[indexPath.row]
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
    
    //button click for store the search text
    @IBAction func search(sender: AnyObject) {
        var history = NSUserDefaults.standardUserDefaults().objectForKey("history")as? [String] ?? [String]()
        if(history.isEmpty == false){
            history.append(self.searchTxt.text!)
            NSUserDefaults.standardUserDefaults().setObject(history, forKey: "history")
            NSUserDefaults.standardUserDefaults().synchronize()
          
        }else{
       
            searchHistory.append(self.searchTxt.text!)
            NSUserDefaults.standardUserDefaults().setObject(searchHistory, forKey: "history")
            NSUserDefaults.standardUserDefaults().synchronize()
            searchHistory.removeAll()
        }
        searchHistoryTable.hidden = true
       
    }


}

