//
//  DetailedResultViewController.swift
//  Team-IOS-Client
//
//  Created by fangjia li on 4/30/16.
//  Copyright © 2016 张仁龙. All rights reserved.
//

import UIKit
import Alamofire

class DetailedResultViewController: UIViewController, UIScrollViewDelegate {
    var detailedResult:NSDictionary=[:]
    
    @IBOutlet weak var scrollImage: UIScrollView!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var brief: UILabel!
    @IBOutlet weak var headIcon: UIImageView!
    @IBOutlet weak var rooms: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var dscrption: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var favorite: UIButton!

    
    var images:[UIImageView] = [UIImageView(image: UIImage(named: "1")!),UIImageView(image: UIImage(named: "2")!),UIImageView(image: UIImage(named: "3")!)]
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    var frame: CGRect = CGRectMake(0, 0, 0, 0)


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
        
        //
        configurePageControl()
        
        scrollImage.delegate = self
        self.view.addSubview(scrollImage)
        for index in 0..<images.count {
            images[index].frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.size.width, height: scrollImage.frame.size.height)
            frame.origin.x = UIScreen.mainScreen().bounds.size.width * CGFloat(index)
            frame.size = UIScreen.mainScreen().bounds.size
            
            self.scrollImage.pagingEnabled = true
            
            let subView = UIView(frame: frame)
            subView.addSubview(images[index])
            self.scrollImage .addSubview(subView)
        }
        
        self.scrollImage.contentSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width * 4, self.scrollImage.frame.size.height)
        pageControl.addTarget(self, action: #selector(DetailedResultViewController.changePage(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }
    @IBAction func saveFavorite(sender: AnyObject) {
        // Send HTTP POST Request
        Alamofire.request(.POST, "http://localhost:8888/favorite", parameters: ["id":detailedResult["id"]!,"username": "hollandlinus@gmail.com"])
            .responseJSON { response in switch response.result {
            case .Success(let JSON):
                let response = JSON as! NSDictionary
                print(response)
                if ((response["code"]?.isEqual("Success") ) != nil){
                self.favorite.setImage(UIImage(named: "favorite"), forState: UIControlState.Normal)
                }
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
                }
        }

        
    }
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        
        self.pageControl.numberOfPages = images.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.redColor()
        self.pageControl.pageIndicatorTintColor = UIColor.blackColor()
        self.pageControl.currentPageIndicatorTintColor = UIColor.greenColor()
        self.view.addSubview(pageControl)
        
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollImage.frame.size.width
        scrollImage.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    
    
    func scrollViewDidEndDecelerating(scrollImage: UIScrollView) {
        
        let pageNumber = round(scrollImage.contentOffset.x / scrollImage.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
