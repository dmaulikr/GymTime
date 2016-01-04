//
//  RegularRegisterPart1.m
//  GymTime
//
//  Created by Sadat Shaik on 12/24/15.
//  Copyright (c) 2015 Sadat Shaik. All rights reserved.
//

#import "RegularRegisterPart1.h"
#import <Parse/Parse.h>
@interface RegularRegisterPart1 ()

@end

@implementation RegularRegisterPart1
@synthesize UsernameField, PasswordField,ContinueButton, FirstNameField, LastNameField, BackButton;
- (void)viewDidLoad {
    [super viewDidLoad];
    [ViewController changeButtonStyle:ContinueButton NewColor:[UIColor turquoiseColor] ShadowColor:[UIColor greenSeaColor]];
    
    [ViewController changeButtonStyle:BackButton NewColor:[UIColor turquoiseColor] ShadowColor:[UIColor greenSeaColor]];
    
    [ViewController changeTextFieldStyle:UsernameField NewColor:[UIColor whiteColor]];
    [ViewController changeTextFieldStyle:FirstNameField NewColor:[UIColor whiteColor]];
    [ViewController changeTextFieldStyle:LastNameField NewColor:[UIColor whiteColor]];
    [ViewController changeTextFieldStyle:PasswordField NewColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"navigating away");
    if([[segue destinationViewController] isKindOfClass:[GetUserStatistics class]]){
        GetUserStatistics * destination = (GetUserStatistics *)[segue destinationViewController];
        destination->emailAddress = self.UsernameField.text;
        destination->firstName = self.FirstNameField.text;
        destination->lastName = self.LastNameField.text;
        destination->password = self.PasswordField.text;
        destination->isFacebookLogin = NO;
    }
}


- (IBAction)ContinueButton:(id)sender {
    /*PFObject *userObject = [PFObject objectWithClassName:@"User"];
    userObject[@"Username"] = UsernameField.text;
    userObject[@"Password"] = PasswordField.text;
    userObject[@"isFacebookLogin"] = @NO;*/
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}
@end
