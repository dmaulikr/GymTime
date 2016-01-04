//
//  DisplayExerciseViewController.h
//  GymTime
//
//  Created by Sadat Shaik on 1/2/16.
//  Copyright (c) 2016 Sadat Shaik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exercise.h"
#import "ViewController.h"
#import "NumberPickerView.h"
#import "GetUserStatistics.h"
@interface DisplayExerciseViewController : UIViewController <UITextFieldDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UITextField *repInput;
@property (weak, nonatomic) IBOutlet UITextField *weightInput;
@property (strong, nonatomic) IBOutlet UIView *setLabel;
@property(strong, nonatomic) Exercise * exerciseToDisplay;

@property(strong, nonatomic) NSMutableArray * sets;

@end
