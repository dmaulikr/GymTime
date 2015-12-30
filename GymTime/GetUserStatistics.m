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
    self.weightNumPicker = [[NumberPickerView alloc]initWithStartingValue:30 endingVal:1000];
    self.weightPicker = [self createNumberPickerViewWithNumPicker:self.weightNumPicker defaultValue:200];
    self.weightField.inputView = self.weightPicker;
    self.weightField.inputAccessoryView = [self createToolbar];
    
    [ViewController changeButtonStyle:self.continueButton NewColor:[UIColor turquoiseColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)disablesAutomaticKeyboardDismissal
{
    NSLog(@"whaaat worked");
    return NO;
}

-(void) inputAccessoryViewDidFinish{
    self.weightField.text = [[NSString alloc]initWithFormat:@"%i", [(UIPickerView *)self.weightField.inputView selectedRowInComponent:0] + 30];

    self->actualWeight = [self.weightField.text intValue] + 30;
    [self.weightField endEditing:YES];
}
-(UIPickerView *) createNumberPickerViewWithNumPicker: (NumberPickerView *) numPickerView defaultValue: (int) defaultValue{
    UIPickerView * tempPicker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 50, 100, 150)];
    tempPicker.delegate = numPickerView;
    [tempPicker selectRow:defaultValue inComponent:0 animated:NO];
    return tempPicker;
}

-(UIToolbar * ) createToolbar{
    
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
    NSLog(@"dading view");
    
    *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
}

@end
