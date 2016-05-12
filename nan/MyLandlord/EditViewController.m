//
//  EditViewController.m
//  MyLandlord
//
//  Created by 长江日报 on 16/5/11.
//  Copyright (c) 2016年 mylandlord. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController
@synthesize picker;
@synthesize houseCategory;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    houseCategory = [[NSArray alloc] initWithObjects:
    @"House",@"Townhouse",@"Condo",nil];
    self.picker.dataSource = self;
    self.picker.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 1;
}

- (NSInteger) pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [houseCategory count];
}

- (NSString*) pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [houseCategory objectAtIndex:row];
}

- (void) pickerView:(UIPickerView*)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}


@end
