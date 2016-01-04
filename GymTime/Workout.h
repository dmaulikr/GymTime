//
//  Workout.h
//  GymTime
//
//  Created by Sadat Shaik on 1/1/16.
//  Copyright (c) 2016 Sadat Shaik. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Exercise.h"
#import "GetWorkouts.h"
@interface Workout : NSObject
{
    NSDate * workoutDate;
    NSString * workoutName;
}

@property (strong, nonatomic) NSArray * exercises;
-(Workout *) initWithExercises:(NSArray *) initExercises;
@end
