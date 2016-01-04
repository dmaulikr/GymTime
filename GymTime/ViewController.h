//
//  ViewController.h
//  GymTime
//
//  Created by Sadat Shaik on 12/23/15.
//  Copyright (c) 2015 Sadat Shaik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <Parse/Parse.h>
#import <FlatUIKit/FlatUIKit.h>
#import "GetWorkouts.h"
#import <SSKeychain/SSKeychain.h>
#import <ParseUI/ParseUI.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>

@interface ViewController : UIViewController
{

}
+(void) changeButtonStyle:(FUIButton *) buttonToChangeStyle NewColor: (UIColor *) buttonColor ShadowColor: (UIColor *) shadowColor;

+(void) changeTextFieldStyle : (FUITextField *) textFieldToChangeStyle NewColor: (UIColor *) Color;

-(void)clickedLoginButton;
@property (weak, nonatomic) IBOutlet UIButton *FacebookLoginButton;

@property (strong,nonatomic) IBOutlet FBSDKLoginButton * loginButton;

@property (weak, nonatomic) IBOutlet FUITextField *UsernameField;
@property (weak, nonatomic) IBOutlet FUITextField *PasswordField;
@property (weak, nonatomic) IBOutlet FUIButton *RegisterButton;
@property (weak, nonatomic) IBOutlet FUIButton *userLoginButton;
@property (weak, nonatomic) IBOutlet FUIButton *loginUser;
- (IBAction)loginAction:(id)sender;

@end

