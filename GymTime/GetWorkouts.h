//
//  GetWorkouts.h
//  GymTime
//
//  Created by Sadat Shaik on 1/1/16.
//  Copyright (c) 2016 Sadat Shaik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Workout.h"
#import "Exercise.h"
@interface GetWorkouts : NSObject
{
    
}
@property (strong, nonatomic) NSDictionary * exerciseDictionary;
+(NSMutableArray *) getWorkoutsForWeek;
+(BOOL) isArrayOfType: (Class) type arrayToCheck: (NSArray *) checkArray raiseException:(BOOL) willRaiseException;
+(void) updateWorkoutModel;
+(NSString *) returnPlistPathForPlist:(NSString *)plistName;
+(NSMutableDictionary *) returnPListDataForPlist:(NSString *) plistName;

@end
