//
//  ViewController.m
//  MyLandlord
//
//  Created by myself on 16/5/10.
//  Copyright (c) 2016 mylandlord. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize fbSignInBtn;
@synthesize googleSignInBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [fbSignInBtn setImage:[UIImage imageNamed:@"facebook.png"] forState:UIControlStateNormal];//button add image
    fbSignInBtn.imageEdgeInsets = UIEdgeInsetsMake(5,5,5,5);
    [googleSignInBtn setImage:[UIImage imageNamed:@"google.png"] forState:UIControlStateNormal];//button add image
    googleSignInBtn.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
