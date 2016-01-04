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
    [self checkIfLoggedIn];
    [GetWorkouts updateWorkoutModel];
    [FacebookLoginButton addTarget:self action:@selector(clickedLoginButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    [Parse setApplicationId:@"HaEsSyaNhlcUQEmxFcZMG7I9DZcPmKI6NmE8oo5D" clientKey:@"vGPIKjHWUclzh1Y4iw5jTP1g19TLvDZAmXi1jdZ7"];
    
    [ViewController changeButtonStyle:RegisterButton NewColor:[UIColor turquoiseColor] ShadowColor:[UIColor greenSeaColor]];
    
    [ViewController changeTextFieldStyle:UsernameField NewColor:[UIColor whiteColor]];
    
    [ViewController changeTextFieldStyle:PasswordField NewColor:[UIColor whiteColor]];
    [ViewController changeButtonStyle:self.userLoginButton NewColor:[UIColor turquoiseColor] ShadowColor:[UIColor greenSeaColor]];
    // Do any additional setup after loading the view, typically from a nib.
    
}


+(void) changeButtonStyle:(FUIButton *) buttonToChangeStyle NewColor: (UIColor *) buttonColor ShadowColor: (UIColor *) shadowColor {
    [buttonToChangeStyle setButtonColor:buttonColor];
    
    [buttonToChangeStyle setShadowColor:shadowColor];
    
    [buttonToChangeStyle setShadowHeight:3.0f];
    
    [buttonToChangeStyle setCornerRadius:6.0f];
    
    buttonToChangeStyle.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    
    [buttonToChangeStyle setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    
    [buttonToChangeStyle setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
}
-(void) checkIfLoggedIn{
    PFUser * currentUser = [PFUser currentUser];
    if(currentUser){
        [self performSegueWithIdentifier:@"loginSuccessfulSegue" sender:self];
    }else{
        NSLog(@"no logged in user");
    }
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
    
    [PFFacebookUtils logInInBackgroundWithReadPermissions:@[@"user_about_me", @"user_relationships", @"user_birthday"] block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in through Facebook!");
            [self performSegueWithIdentifier:@"FacebookRegister" sender:self];
        } else {
            NSLog(@"User logged in through Facebook!");
        }
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)loginAction:(id)sender {
    [PFUser logInWithUsernameInBackground:self.UsernameField.text password:self.PasswordField.text block:^(PFUser * user, NSError * error){
        if(user){
            NSLog(@"User logged in");
            [self performSegueWithIdentifier:@"loginSuccessfulSegue" sender:self];
        }
    }];
}
@end
