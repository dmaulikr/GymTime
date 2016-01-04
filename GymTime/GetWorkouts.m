//
//  GetWorkouts.m
//  GymTime
//
//  Created by Sadat Shaik on 1/1/16.
//  Copyright (c) 2016 Sadat Shaik. All rights reserved.
//

#import "GetWorkouts.h"

@implementation GetWorkouts
{
    
}

+(NSArray *) getWorkoutsForWeek{
    NSArray * weekWorkouts;
    Workout * mondayWorkout,*wednesdayWorkout, *fridayWorkout;
    //Monday - Chest and Tricep
    NSArray * chestExercises = [self convertArrayOfExerciseNamesToArrayOfDummyExercises:[self GetExerciseNamesForMuscleGroup:@"Chest"]];
    NSLog(@"%i", [chestExercises count]);
    NSArray * tricepExercises = [self convertArrayOfExerciseNamesToArrayOfDummyExercises:[self GetExerciseNamesForMuscleGroup:@"Tricep"]];
    //Wednesday
    NSArray * backExercises = [self convertArrayOfExerciseNamesToArrayOfDummyExercises:[self GetExerciseNamesForMuscleGroup:@"Back"]];
    NSArray * bicepExercises = [self convertArrayOfExerciseNamesToArrayOfDummyExercises:[self GetExerciseNamesForMuscleGroup:@"Biceps"]];
    //Friday
    NSArray * calveExercises = [self convertArrayOfExerciseNamesToArrayOfDummyExercises:[self GetExerciseNamesForMuscleGroup:@"Calves"]];
    NSArray * hamstringExercises = [self convertArrayOfExerciseNamesToArrayOfDummyExercises:[self GetExerciseNamesForMuscleGroup:@"Hamstrings"]];
    NSArray * quadExercises = [self convertArrayOfExerciseNamesToArrayOfDummyExercises:[self GetExerciseNamesForMuscleGroup:@"Quads"]];
    
    mondayWorkout = [[Workout alloc] initWithExercises:[chestExercises arrayByAddingObjectsFromArray:tricepExercises]];
    wednesdayWorkout = [[Workout alloc] initWithExercises:[backExercises arrayByAddingObjectsFromArray:bicepExercises]];
    fridayWorkout = [[Workout alloc] initWithExercises:[calveExercises arrayByAddingObjectsFromArray:[hamstringExercises arrayByAddingObjectsFromArray:quadExercises]]];
    
    weekWorkouts = @[mondayWorkout,wednesdayWorkout,fridayWorkout];
    return weekWorkouts;
}

+(Exercise *)convertExerciseNameToDummyExercise: (NSString *)exerciseName{
    Exercise * newExercise = [[Exercise alloc] initWithName:exerciseName numSets:4 numReps:@[[self returnNSNumberFromInt:12],[self returnNSNumberFromInt:10],[self returnNSNumberFromInt:10],[self returnNSNumberFromInt:8]] weights:@[[self returnNSNumberFromInt:30],[self returnNSNumberFromInt:30],[self returnNSNumberFromInt:30],[self returnNSNumberFromInt:30]]];
    return newExercise;
}
+(NSNumber *) returnNSNumberFromInt: (int) toConvert{
    return [[NSNumber alloc] initWithInt:toConvert];
}
+(void) updateWorkoutModel{
    PFQuery * query = [PFQuery queryWithClassName:@"MuscleGroups"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * objects, NSError * error){
        if(!error){
            for(PFObject * object in objects){
                [self UpdateWorkoutsForMuscleGroup:object[@"MuscleGroup"]];
            }
        }else{
            NSLog(@"error connecting to database");
        }
    }];
    
}
+(NSArray *) convertArrayOfExerciseNamesToArrayOfDummyExercises: (NSArray *) exerciseNames{
    NSMutableArray * dummyExercises = [[NSMutableArray alloc] init];
    for(NSString * exerciseName in exerciseNames){
        [dummyExercises addObject:[self convertExerciseNameToDummyExercise:exerciseName]];
    }
    return [dummyExercises copy];
}
+(NSArray *) GetExerciseNamesForMuscleGroup: (NSString *) muscleGroup{
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Exercises.plist"]; //3
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: path]) //4
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"Exercises" ofType:@"plist"]; //5
        
        [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
    }
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    NSString * exerciseNames = [data objectForKey:muscleGroup];
    NSArray * exercises = [exerciseNames componentsSeparatedByString:@","];
    return exercises;
}
+(void) UpdateWorkoutsForMuscleGroup: (NSString *) muscleGroup{
    PFQuery * muscleGroupQuery = [PFQuery queryWithClassName:@"Exercises"];
    [muscleGroupQuery whereKey:@"Primary_Muscle_Groups" equalTo:muscleGroup];
    [muscleGroupQuery findObjectsInBackgroundWithBlock:^(NSArray * objects, NSError * error){
        NSMutableArray * exerciseNames = [[NSMutableArray alloc] init];
        if(!error){
            for(PFObject * exercise in objects){
                [exerciseNames addObject:exercise[@"ExerciseName"]];
            }
            [self updatePListWithExercises:exerciseNames ofPrimaryMuscleGroup:muscleGroup];
        }else{
            NSLog(@"Error retrieving items from database");
        }
    }];
}
+(NSString *) returnPlistPathForPlist:(NSString *)plistName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSString *path = [documentsDirectory stringByAppendingPathComponent:plistName]; //3
    return path;
}
+(NSMutableDictionary *) returnPListDataForPlist:(NSString *) plistName{
    NSError *error;
    NSLog(@"got path again");
    NSString * path = [GetWorkouts returnPlistPathForPlist:plistName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSLog(@"before splitting string");
    NSArray * plistParts = [plistName componentsSeparatedByString:@"."];
    if (![fileManager fileExistsAtPath: path]) //4
    {
        NSLog(@"part1:%@, part2:%@",[plistParts objectAtIndex:0], [plistParts objectAtIndex:1]);
        NSString *bundle = [[NSBundle mainBundle] pathForResource:[plistParts objectAtIndex:0] ofType:[plistParts objectAtIndex:1]]; //5
        NSLog(@"copying item");
        [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
        NSLog(@"error:%@",error.description);
        if(error){
            NSLog(@"error getting data:%@", error.description);
        }
    }
    NSLog(@"retrunting data");
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    return data;
}
+(void) updatePListWithExercises:(NSArray *) exercises ofPrimaryMuscleGroup: (NSString *) muscleGroup{
    NSMutableDictionary * data = [GetWorkouts returnPListDataForPlist:@"Exercises.plist"];
    NSMutableString * exerciseStrings = [[NSMutableString alloc] init];
    
    for(NSString * exerciseName in exercises){
        [exerciseStrings appendString:exerciseName];
        [exerciseStrings appendString:@","];
    }
    exerciseStrings = [[exerciseStrings substringToIndex:([exerciseStrings length]-1)] copy];
    [data setObject:exerciseStrings forKey:muscleGroup];
    [data writeToFile:[GetWorkouts returnPlistPathForPlist:@"Exercises.plist"] atomically:YES];
}


+(BOOL) isArrayOfType: (Class) type arrayToCheck: (NSArray *) checkArray raiseException:(BOOL) willRaiseException{
    if([checkArray count] == 0){
        return YES;
    }
    for(id object in checkArray){
        if(![object isKindOfClass:type]){
            [NSException raise:@"InvalidArrayException" format:@"The array was expected to be of type: %@, but instead was of type: %@",type, [object class]];
            return NO;
        }
    }
    return YES;
}

@end
