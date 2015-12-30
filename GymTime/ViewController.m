//
//  ViewController.m
//  GymTime
//
//  Created by Sadat Shaik on 12/23/15.
//  Copyright (c) 2015 Sadat Shaik. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize FacebookLoginButton, UsernameField,PasswordField,RegisterButton;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [FacebookLoginButton addTarget:self action:@selector(clickedLoginButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    [Parse setApplicationId:@"HaEsSyaNhlcUQEmxFcZMG7I9DZcPmKI6NmE8oo5D" clientKey:@"vGPIKjHWUclzh1Y4iw5jTP1g19TLvDZAmXi1jdZ7"];
    
    [ViewController changeButtonStyle:RegisterButton NewColor:[UIColor turquoiseColor]];
    
    [ViewController changeTextFieldStyle:UsernameField NewColor:[UIColor whiteColor]];
    
    [ViewController changeTextFieldStyle:PasswordField NewColor:[UIColor whiteColor]];
    
    // Do any additional setup after loading the view, typically from a nib.
    
}

+(void) changeButtonStyle:(FUIButton *) buttonToChangeStyle NewColor: (UIColor *) buttonColor  {
    [buttonToChangeStyle setButtonColor:buttonColor];
    
    [buttonToChangeStyle setShadowColor:[UIColor greenSeaColor]];
    
    [buttonToChangeStyle setShadowHeight:3.0f];
    
    [buttonToChangeStyle setCornerRadius:6.0f];
    
    buttonToChangeStyle.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    
    [buttonToChangeStyle setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    
    [buttonToChangeStyle setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
}

+(void) changeTextFieldStyle : (FUITextField *) textFieldToChangeStyle NewColor: (UIColor *) buttonColor{
    
    textFieldToChangeStyle.font = [UIFont flatFontOfSize:16];
    textFieldToChangeStyle.backgroundColor = buttonColor;
    textFieldToChangeStyle.edgeInsets = UIEdgeInsetsMake(4.0f, 15.0f, 4.0f, 15.0f);
    textFieldToChangeStyle.textFieldColor = [UIColor whiteColor];
    textFieldToChangeStyle.borderColor = [UIColor turquoiseColor];
    textFieldToChangeStyle.borderWidth = 2.0f;
    textFieldToChangeStyle.cornerRadius = 3.0f;
}

-(void)clickedLoginButton{
    NSLog(@"clicked button");
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
             [self performSegueWithIdentifier:@"FacebookRegister" sender:self];
         }
     }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
