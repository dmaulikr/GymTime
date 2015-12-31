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
    
    [self setGoals:[[NSArray alloc]initWithObjects:@"Weight Loss",@"Lean Muscle", @"General Fitness", @"Athletic training", nil]];
    
    [self.goalPicker selectRow:2 inComponent:0 animated:NO];
    
    self.weightNumPicker = [[NumberPickerView alloc]initWithStartingValue:30 endingVal:1000];
    self.weightPicker = [self createNumberPickerViewWithNumPicker:self.weightNumPicker defaultValue:140];
    self.weightField.inputView = self.weightPicker;
    self.weightField.inputAccessoryView = [self createToolbar];
    
    self.ftNumPicker = [[NumberPickerView alloc]initWithStartingValue:1 endingVal:8];
    self.ftPicker = [self createNumberPickerViewWithNumPicker:self.ftNumPicker defaultValue:4];
    self.ftField.inputView = self.ftPicker;
    self.ftField.inputAccessoryView = [self createToolbar];
    
    self.inNumPicker = [[NumberPickerView alloc]initWithStartingValue:0 endingVal:11];
    self.inPicker = [self createNumberPickerViewWithNumPicker:self.inNumPicker defaultValue:10];
    self.inField.inputView = self.inPicker;
    self.inField.inputAccessoryView = [self createToolbar];
    
    self.ageNumPicker = [[NumberPickerView alloc]initWithStartingValue:0 endingVal:11];
    self.agePicker = [self createNumberPickerViewWithNumPicker:self.ageNumPicker defaultValue:10];
    self.ageField.inputView = self.agePicker;
    self.ageField.inputAccessoryView = [self createToolbar];
    
    [ViewController changeButtonStyle:self.continueButton NewColor:[UIColor turquoiseColor]];
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
    
    int inputAge = [(UIPickerView *)self.ageField.inputView selectedRowInComponent:0];
    
    self.ftField.text = [[NSString alloc]initWithFormat:@"%i", feet];
    
    self.inField.text = [[NSString alloc]initWithFormat:@"%i", inches];
    
    self.ageField.text = [[NSString alloc]initWithFormat:@"%i", inches];
    
    self->height = feet * 12 + inches;
    
    self->age = inputAge;
    
    [self.inField endEditing:YES];
    [self.ftField endEditing:YES];
    [self.weightField endEditing:YES];
    [self.ageField endEditing:YES];
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


@end
