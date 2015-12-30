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

-(NumberPickerView *) initWithStartingValue: (int) startingVal endingVal: (int) endingVal
{
    self = [super init];
    startingValue = startingVal;
    endingValue = endingVal;
    return self;
}
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSLog(@"calling this function");
    return endingValue - startingValue + 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [[NSString alloc]initWithFormat:@"%i", (int)(row) + startingValue];
}


@end