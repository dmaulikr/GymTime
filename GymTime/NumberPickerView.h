//
//  NumberPickerView.h
//  GymTime
//
//  Created by Sadat Shaik on 12/29/15.
//  Copyright (c) 2015 Sadat Shaik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NumberPickerView : NSObject <UIPickerViewDelegate>
{
    int startingValue;
    int endingValue;
}
@property(nonatomic,strong) id<UIPickerViewDelegate>   delegate;
-(NumberPickerView *) initWithStartingValue: (int) startingVal endingVal: (int) endingVal;
@end

