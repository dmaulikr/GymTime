//
//  FacebookRegisterPart1.h
//  GymTime
//
//  Created by Sadat Shaik on 12/24/15.
//  Copyright (c) 2015 Sadat Shaik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "ViewController.h"

@interface FacebookRegisterPart1 : UIViewController
@property (weak, nonatomic) IBOutlet FUITextField *UsernameField;
- (IBAction)ContinueButton:(id)sender;
@property (weak, nonatomic) IBOutlet FUIButton *ContinueButton;

@end
