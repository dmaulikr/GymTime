//
//  FacebookRegisterPart1.m
//  GymTime
//
//  Created by Sadat Shaik on 12/24/15.
//  Copyright (c) 2015 Sadat Shaik. All rights reserved.
//

#import "FacebookRegisterPart1.h"

@interface FacebookRegisterPart1 ()

@end

@implementation FacebookRegisterPart1
@synthesize UsernameField, ContinueButton;
- (void)viewDidLoad {
    [super viewDidLoad];
    [ViewController changeTextFieldStyle:UsernameField NewColor:[UIColor whiteColor]];
    [ViewController changeButtonStyle:ContinueButton NewColor:[UIColor turquoiseColor]];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ContinueButton:(id)sender {
    PFObject *userObject = [PFObject objectWithClassName:@"User"];
    userObject[@"Username"] = UsernameField.text;
    userObject[@"isFacebookLogin"] = @NO;
}
@end
