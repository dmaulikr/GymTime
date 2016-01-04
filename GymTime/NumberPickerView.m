//
//  NumberPickerView.m
//  GymTime
//
//  Created by Sadat Shaik on 12/29/15.
//  Copyright (c) 2015 Sadat Shaik. All rights reserved.
//

#import "NumberPickerView.h"

@interface NumberPickerView()

@end


@implementation NumberPickerView

-(NumberPickerView *) initWithStartingValue: (int) startingVal endingVal: (int) endingVal increment: (int) inc
{
    self = [super init];
    startingValue = startingVal;
    endingValue = endingVal;
    increment = inc;
    return self;
}
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return endingValue - startingValue + 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [[NSString alloc]initWithFormat:@"%i",startingValue + (int)(row)*increment];
}


@end