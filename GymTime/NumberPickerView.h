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
    @public int startingValue;
    @public int endingValue;
    @public int increment;
}
@property(nonatomic,strong) id<UIPickerViewDelegate>   delegate;
-(NumberPickerView *) initWithStartingValue: (int) startingVal endingVal: (int) endingVal increment: (int) inc;
@end

