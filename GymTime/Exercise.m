//
//  Exercise.m
//  GymTime
//
//  Created by Sadat Shaik on 1/1/16.
//  Copyright (c) 2016 Sadat Shaik. All rights reserved.
//

#import "Exercise.h"

@implementation Exercise
{
     
}


-(Exercise *) initWithName: (NSString *) initExerciseName numSets:(int) initNumSets numReps: (NSArray *) initReps weights: (NSArray *) initWeights{
    self = [super init];
    [GetWorkouts isArrayOfType:[NSNumber class] arrayToCheck:initReps raiseException:YES];
    [GetWorkouts isArrayOfType:[NSNumber class] arrayToCheck:initWeights raiseException:YES];
    if(!([initReps count] == [initWeights count] && [initReps count] == initNumSets)){
        [NSException raise:@"InvalidExerciseException" format:@"The number of reps did not match the number of weights or the number of sets."];
    }
    self->numSets = initNumSets;
    self-> weights = initWeights;
    self.exerciseName = initExerciseName;
    self -> reps = initReps;
    return self;
}
@end
