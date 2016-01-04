//
//  GetUserStatistics.m
//  GymTime
//
//  Created by Sadat Shaik on 12/24/15.
//  Copyright (c) 2015 Sadat Shaik. All rights reserved.
//

#import "GetUserStatistics.h"

@interface GetUserStatistics ()

@end

@implementation GetUserStatistics

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([FBSDKAccessToken currentAccessToken]) {
        FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"/me" parameters:@{ @"fields": @"id,first_name,last_name,email"}
            HTTPMethod:@"GET"];
        [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                              id result,
                                              NSError *error) {
            if(result){
                emailAddress = result[@"email"];
                firstName = result[@"first_name"];
                lastName = result[@"last_name"];
                password = [GetUserStatistics generateRandomSalt];
                NSLog(@"%@,%@,%@",emailAddress,firstName,lastName);
            }else{
                NSLog(@"Experienced error: %@", error);
            }
            // Handle the result
        }];

    }
    else{
        NSLog(@"no sess");
    }
    
    [self setGoals:[[NSArray alloc]initWithObjects:@"Weight Loss",@"Lean Muscle", @"General Fitness", @"Athletic training", nil]];
    
    [self.goalPicker selectRow:2 inComponent:0 animated:NO];
    
    self.weightNumPicker = [[NumberPickerView alloc]initWithStartingValue:30 endingVal:1000 increment:1];
    self.weightPicker = [GetUserStatistics createNumberPickerViewWithNumPicker:self.weightNumPicker defaultValue:140];
    self.weightField.inputView = self.weightPicker;
    self.weightField.inputAccessoryView = [self createToolbar];
    
    self.ftNumPicker = [[NumberPickerView alloc]initWithStartingValue:1 endingVal:8 increment:1];
    self.ftPicker = [GetUserStatistics createNumberPickerViewWithNumPicker:self.ftNumPicker defaultValue:4];
    self.ftField.inputView = self.ftPicker;
    self.ftField.inputAccessoryView = [self createToolbar];
    
    self.inNumPicker = [[NumberPickerView alloc]initWithStartingValue:0 endingVal:11 increment:1];
    self.inPicker = [GetUserStatistics createNumberPickerViewWithNumPicker:self.inNumPicker defaultValue:10];
    self.inField.inputView = self.inPicker;
    self.inField.inputAccessoryView = [self createToolbar];
    
    self.ageNumPicker = [[NumberPickerView alloc]initWithStartingValue:13 endingVal:100 increment:1];
    self.agePicker = [GetUserStatistics createNumberPickerViewWithNumPicker:self.ageNumPicker defaultValue:7];
    self.ageField.inputView = self.agePicker;
    self.ageField.inputAccessoryView = [self createToolbar];
    
    [ViewController changeButtonStyle:self.continueButton NewColor:[UIColor turquoiseColor] ShadowColor:[UIColor greenSeaColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)disablesAutomaticKeyboardDismissal
{
    return NO;
}

-(void) inputAccessoryViewDidFinish{
    self.weightField.text = [[NSString alloc]initWithFormat:@"%i", [(UIPickerView *)self.weightField.inputView selectedRowInComponent:0] + 30];
    self->weight = [self.weightField.text intValue] + 30;
    int feet = [(UIPickerView *)self.ftField.inputView selectedRowInComponent:0] + 1;
    
    int inches = [(UIPickerView *)self.inField.inputView selectedRowInComponent:0];
    
    int inputAge = [(UIPickerView *)self.ageField.inputView selectedRowInComponent:0] + 13;
    
    self.ftField.text = [[NSString alloc]initWithFormat:@"%i", feet];
    
    self.inField.text = [[NSString alloc]initWithFormat:@"%i", inches];
    
    self.ageField.text = [[NSString alloc]initWithFormat:@"%i", inputAge];
    
    self->height = feet * 12 + inches;
    
    self->age = inputAge;
    
    [self.inField endEditing:YES];
    [self.ftField endEditing:YES];
    [self.weightField endEditing:YES];
    [self.ageField endEditing:YES];
}
+(UIPickerView *) createNumberPickerViewWithNumPicker: (NumberPickerView *) numPickerView defaultValue: (int) defaultValue{
    UIPickerView * tempPicker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 50, 100, 150)];
    tempPicker.delegate = numPickerView;
    NSLog(@"default value: %i", defaultValue);
    [tempPicker selectRow:defaultValue inComponent:0 animated:NO];
    return tempPicker;
}

-(UIToolbar *) createToolbar{
    
    UIToolbar *myToolbar = [[UIToolbar alloc] initWithFrame:
                            CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
    UIBarButtonItem *doneButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                  target:self action:@selector(inputAccessoryViewDidFinish)];
    
    
    //using default text field delegate method here, here you could call
    //myTextField.resignFirstResponder to dismiss the views
    [myToolbar setItems:[NSArray arrayWithObject: doneButton] animated:NO];
    return myToolbar;
}
-(void) addPickerViewToTextField: (UITextField **) textField pickerViewToAdd : (UIPickerView **) pickerView{
    
    *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
}


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.goals count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.goals objectAtIndex:row];
}
- (IBAction)submitUserData:(id)sender {
    __block PFUser * user = [PFUser user];
    user.username = emailAddress;
    user.password = password;
    user.email = emailAddress;
    user[@"height"] = [[NSArray alloc] initWithObjects:[[NSNumber alloc] initWithInt:self->height], nil];
    user[@"weight"] = [[NSArray alloc] initWithObjects:[[NSNumber alloc] initWithInt:self->weight], nil];
    user[@"age"] = [NSNumber numberWithInt:age];
    user[@"fitnessGoal"] = [[NSArray alloc] initWithObjects:[self.goals objectAtIndex:[self.goalPicker selectedRowInComponent:0]], nil];
    NSLog(@"before save");
    if(isFacebookLogin){
        PFQuery * userQuery = [PFUser query];
        [userQuery whereKey:@"email" equalTo:emailAddress];
        [userQuery findObjectsInBackgroundWithBlock:^(NSArray * objects, NSError * error){
            if(!error){
                if([objects count] == 1){
                    PFUser * fbUser = [objects objectAtIndex:0];
                    fbUser[@"height"] = user[@"height"];
                    fbUser[@"weight"] = user[@"weight"];
                    fbUser[@"age"] = user[@"age"];
                    user[@"fitnessGoal"] = user[@"fitnessGoal"];
                    [fbUser saveInBackground];
                }else{
                    NSLog(@"major error here");
                }
            }
        }];
    }else{
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error){
            if(succeeded){
                [self performSegueWithIdentifier:@"registerSegue" sender:self];
            }else{
                NSLog(@"Error: %@", error.description);
            }
        }];
    }
    

}
+ (NSString*)md5HexDigest:(NSString*)input {
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}
+(NSString *) generateRandomSalt{
    NSString *alphabet  = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789";
    NSMutableString *s = [NSMutableString stringWithCapacity:20];
    for (NSUInteger i = 0U; i < 20; i++) {
        u_int32_t r = arc4random() % [alphabet length];
        unichar c = [alphabet characterAtIndex:r];
        [s appendFormat:@"%C", c];
    }
    return [s copy];
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([sender isKindOfClass:[RegularRegisterPart1 class]]){
        RegularRegisterPart1 * sourceController = (RegularRegisterPart1 *)sender;
        self->emailAddress = sourceController.UsernameField.text;
        self->firstName = sourceController.FirstNameField.text;
        self->lastName = sourceController.LastNameField.text;
        self->password = sourceController.PasswordField.text;
        isFacebookLogin = NO;
    }
    if([sender isKindOfClass:[ViewController class]]){
        isFacebookLogin = YES;
    }
}


@end
