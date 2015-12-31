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

@interface GetUserStatistics : UIViewController <UIPickerViewDelegate>
{
    int weight;
    int height;
    int age;
}

@property (weak, nonatomic) IBOutlet UITextField *weightField;
@property (strong, nonatomic) UIPickerView * weightPicker;
@property (strong, nonatomic) NumberPickerView * weightNumPicker;

@property (weak, nonatomic) IBOutlet UIPickerView *goalPicker;

@property (strong, nonatomic) NSArray * goals;

@property (weak, nonatomic) IBOutlet UITextField *ftField;
@property (strong, nonatomic) UIPickerView * ftPicker;
@property (strong, nonatomic) NumberPickerView * ftNumPicker;

@property (weak, nonatomic) IBOutlet UITextField *inField;
@property (strong, nonatomic) UIPickerView * inPicker;
@property (strong, nonatomic) NumberPickerView * inNumPicker;

@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (strong, nonatomic) UIPickerView * agePicker;
@property (strong, nonatomic) NumberPickerView * ageNumPicker;

@property (weak, nonatomic) IBOutlet FUIButton *continueButton;

@end
