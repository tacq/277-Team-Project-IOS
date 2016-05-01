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

    @IBOutlet weak var coverImg: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var landlordName: UILabel!
    @IBOutlet weak var headIcon: UIImageView!
    @IBOutlet weak var rooms: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var dscrp: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var scrollableImg: UIScrollView!
    var colors:[UIColor] = [UIColor.redColor(), UIColor.blueColor(), UIColor.greenColor(), UIColor.yellowColor()]

    var frame: CGRect = CGRectMake(0, 734, 400, 266)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(detailedResult)
        
        self.scrollableImg.frame = CGRectMake(0, 734, self.view.frame.width, self.view.frame.height)
        let scrollViewWidth:CGFloat = self.scrollableImg.frame.width
        let scrollViewHeight:CGFloat = self.scrollableImg.frame.height
        
        let imgOne = UIImageView(frame: CGRectMake(0, 734,scrollViewWidth, scrollViewHeight))
        imgOne.image = UIImage(named: "Slide 1")
        let imgTwo = UIImageView(frame: CGRectMake(scrollViewWidth, 734,scrollViewWidth, scrollViewHeight))
        imgTwo.image = UIImage(named: "Slide 2")
        let imgThree = UIImageView(frame: CGRectMake(scrollViewWidth*2, 734,scrollViewWidth, scrollViewHeight))
        imgThree.image = UIImage(named: "Slide 3")
        let imgFour = UIImageView(frame: CGRectMake(scrollViewWidth*3, 734,scrollViewWidth, scrollViewHeight))
        imgFour.image = UIImage(named: "Slide 4")
        
        self.scrollableImg.addSubview(imgOne)
        self.scrollableImg.addSubview(imgTwo)
        self.scrollableImg.addSubview(imgThree)
        self.scrollableImg.addSubview(imgFour)
        
        self.scrollableImg.contentSize = CGSizeMake(self.scrollableImg.frame.width * 4, self.scrollableImg.frame.height)
        self.scrollableImg.delegate = self
     
    }

}
