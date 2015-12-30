//
//  RegularRegisterPart1.h
//  GymTime
//
//  Created by Sadat Shaik on 12/24/15.
//  Copyright (c) 2015 Sadat Shaik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface RegularRegisterPart1 : UIViewController
@property (weak, nonatomic) IBOutlet FUITextField *UsernameField;
@property (weak, nonatomic) IBOutlet FUITextField *PasswordField;
- (IBAction)ContinueButton:(id)sender;
@property (weak, nonatomic) IBOutlet FUIButton *ContinueButton;
@property (weak, nonatomic) IBOutlet FUITextField *FirstNameField;
@property (weak, nonatomic) IBOutlet FUITextField *LastNameField;
@property (weak, nonatomic) IBOutlet FUIButton *BackButton;

@end
