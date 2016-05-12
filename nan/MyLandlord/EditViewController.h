//
//  EditViewController.h
//  MyLandlord
//
//  Created by 长江日报 on 16/5/11.
//  Copyright (c) 2016年 mylandlord. All rights reserved.
//

#import "ViewController.h"

@interface EditViewController : ViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) NSArray *houseCategory;
@end
