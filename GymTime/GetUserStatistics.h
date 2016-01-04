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
#import "RegularRegisterPart1.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <CommonCrypto/CommonDigest.h>
#import <SSKeychain/SSKeychain.h>
@interface GetUserStatistics : UIViewController <UIPickerViewDelegate>
{
    int weight;
    int height;
    int age;
    @public NSString * emailAddress;
    @public NSString * password;
    @public NSString * firstName;
    @public NSString * lastName;
    @public BOOL isFacebookLogin;
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
+ (NSString*)md5HexDigest:(NSString*)input;
+(NSString *) generateRandomSalt;
+(UIPickerView *) createNumberPickerViewWithNumPicker: (NumberPickerView *) numPickerView defaultValue: (int) defaultValue;
-(UIToolbar *) createToolbar;

@end
