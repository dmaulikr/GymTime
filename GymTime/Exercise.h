//
//  Exercise.h
//  GymTime
//
//  Created by Sadat Shaik on 1/1/16.
//  Copyright (c) 2016 Sadat Shaik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetWorkouts.h"
@interface Exercise : NSObject
{
    @public NSArray * weights;
    @public NSArray * reps;
    @public int numSets;
}
-(Exercise *) initWithName: (NSString *) initExerciseName numSets:(int) initNumSets numReps: (NSArray *) initReps weights: (NSArray *) initWeights;
@property(strong, nonatomic) NSString * exerciseName;
@end
