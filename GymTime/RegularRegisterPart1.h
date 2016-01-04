//
//  RegularRegisterPart1.h
//  GymTime
//
//  Created by Sadat Shaik on 12/24/15.
//  Copyright (c) 2015 Sadat Shaik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "GetUserStatistics.h"

@interface RegularRegisterPart1 : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet FUITextField *UsernameField;
@property (strong, nonatomic) IBOutlet FUITextField *PasswordField;
- (IBAction)ContinueButton:(id)sender;
@property (weak, nonatomic) IBOutlet FUIButton *ContinueButton;
@property (strong, nonatomic) IBOutlet FUITextField *FirstNameField;
@property (strong, nonatomic) IBOutlet FUITextField *LastNameField;
@property (weak, nonatomic) IBOutlet FUIButton *BackButton;

@end
