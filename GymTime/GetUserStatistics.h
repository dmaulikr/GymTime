//
//  GetUserStatistics.h
//  GymTime
//
//  Created by Sadat Shaik on 12/24/15.
//  Copyright (c) 2015 Sadat Shaik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NumberPickerView.h"
#import "ViewController.h"

@interface GetUserStatistics : UIViewController
{
    int actualWeight;
}

@property (weak, nonatomic) IBOutlet UITextField *weightField;
@property (strong, nonatomic) UIPickerView * weightPicker;
@property (strong, nonatomic) NumberPickerView * weightNumPicker;

@property (weak, nonatomic) IBOutlet FUIButton *continueButton;

@end
