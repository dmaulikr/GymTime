//
//  Workout.m
//  GymTime
//
//  Created by Sadat Shaik on 1/1/16.
//  Copyright (c) 2016 Sadat Shaik. All rights reserved.
//

#import "Workout.h"

@implementation Workout

-(Workout *) initWithExercises:(NSArray *) initExercises{
    self = [super init];
    [GetWorkouts isArrayOfType:[Exercise class] arrayToCheck:initExercises raiseException:YES];
    self.exercises = initExercises;
    return self;
}
@end
