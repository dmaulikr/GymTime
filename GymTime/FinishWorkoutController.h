//
//  FinishWorkoutController.h
//  GymTime
//
//  Created by Sadat Shaik on 1/3/16.
//  Copyright (c) 2016 Sadat Shaik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface FinishWorkoutController : UIViewController
{
    int difficulty;
    int effectiveness;
    int enjoyment;
}
@property(strong, nonatomic) IBOutletCollection(UIButton)NSArray * difficultyStars;

@property(strong, nonatomic) IBOutletCollection(UIButton)NSArray * effectivenessStars;
@property (weak, nonatomic) IBOutlet FUIButton *submitButton;
- (IBAction)submitData:(id)sender;

@property(strong, nonatomic) IBOutletCollection(UIButton)NSArray * enjoymentStars;
@end
