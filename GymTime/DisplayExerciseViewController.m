//
//  DisplayExerciseViewController.m
//  GymTime
//
//  Created by Sadat Shaik on 1/2/16.
//  Copyright (c) 2016 Sadat Shaik. All rights reserved.
//

#import "DisplayExerciseViewController.h"

@interface DisplayExerciseViewController ()

@end

@implementation DisplayExerciseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.exerciseToDisplay.exerciseName;
    self.sets = [[NSMutableArray alloc] init];
    int startingX = 50;
    int startingY = 150;
    
    for(int i = 0 ; i<((int)self.exerciseToDisplay->numSets); i++){
        UILabel * newLabel = [[UILabel alloc] initWithFrame:CGRectMake(startingX, startingY + 50*i, 50, 20)];
        newLabel.text = [[NSString alloc] initWithFormat:@"Set %i", i];
        UITextField * newWeightField = [self createNewTextFieldWithFrame:CGRectMake(startingX + 45, startingY - 5 + 50*i, 100, 30)];
        NumberPickerView * pickWeight = [[NumberPickerView alloc] initWithStartingValue:5 endingVal:1000 increment:5];
        UIPickerView * weightFieldInput = [GetUserStatistics createNumberPickerViewWithNumPicker:pickWeight defaultValue:(([(NSNumber *)[self.exerciseToDisplay->reps objectAtIndex:i] intValue] / pickWeight->increment) + pickWeight->startingValue)];
        newWeightField.text = [[NSString alloc] initWithFormat:@"%i",[(NSNumber *)[self.exerciseToDisplay->weights objectAtIndex:i] intValue]];
        newWeightField.inputView = weightFieldInput;
        newWeightField.inputAccessoryView = [self createToolbar];
        UITextField * newRepsField = [self createNewTextFieldWithFrame:CGRectMake(startingX + 170, startingY - 5 + 50*i, 50, 30)];
        NumberPickerView * pickReps = [[NumberPickerView alloc] initWithStartingValue:0 endingVal:100 increment:1];
        UIPickerView * repFieldInput = [GetUserStatistics createNumberPickerViewWithNumPicker:pickReps defaultValue:(([(NSNumber *)[self.exerciseToDisplay->reps objectAtIndex:i] intValue] / pickReps->increment) + pickReps->startingValue)];
        newRepsField.text = [[NSString alloc] initWithFormat:@"%i",[(NSNumber *)[self.exerciseToDisplay->reps objectAtIndex:i] intValue]];
        newRepsField.inputView = repFieldInput;
        newRepsField.inputAccessoryView = [self createToolbar];
        NSArray * newSet = [[NSArray alloc] initWithObjects:newLabel,newWeightField, pickWeight, weightFieldInput, newRepsField,pickReps, repFieldInput, nil];
        [self.view addSubview:newLabel];
        [self.view addSubview:newWeightField];
        [self.view addSubview:newRepsField];
        [self.sets addObject:newSet];
    }
    // Do any additional setup after loading the view.
}

-(UITextField *) createNewTextFieldWithFrame: (CGRect) frame{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.font = [UIFont systemFontOfSize:15];
    textField.placeholder = @"";
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.delegate = self;
    return textField;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

-(void) inputAccessoryViewDidFinish{
    for(NSArray * set in self.sets){
        NumberPickerView * weightNumPicker = [set objectAtIndex:2];
        UIPickerView * weightPicker = [set objectAtIndex:3];
        ((UITextField *)[set objectAtIndex:1]).text = [[NSString alloc] initWithFormat:@"%i",([weightPicker selectedRowInComponent:0]*weightNumPicker->increment) + (weightNumPicker->startingValue)];
        
        NumberPickerView * repNumPicker = [set objectAtIndex:5];
        UIPickerView * repPicker = [set objectAtIndex:6];
        ((UITextField *)[set objectAtIndex:4]).text = [[NSString alloc] initWithFormat:@"%i",([repPicker selectedRowInComponent:0]*repNumPicker->increment) + (repNumPicker->startingValue)];
        [((UITextField *)[set objectAtIndex:1]) endEditing:YES];
        [((UITextField *)[set objectAtIndex:4]) endEditing:YES];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
