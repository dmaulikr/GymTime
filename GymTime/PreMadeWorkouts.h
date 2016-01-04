//
//  PreMadeWorkouts.h
//  GymTime
//
//  Created by Sadat Shaik on 1/1/16.
//  Copyright (c) 2016 Sadat Shaik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetWorkouts.h"
#import "Exercise.h"
#import "Workout.h"
@interface PreMadeWorkouts : NSObject
{
    
}
@property (strong, nonatomic) Workout * mondayWorkout;
@property (strong, nonatomic) Workout * wednesdayWorkout;
@property (strong, nonatomic) Workout * fridayWorkout;

@end
