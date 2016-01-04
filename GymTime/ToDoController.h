//
//  ToDoController.h
//  GymTime
//
//  Created by Sadat Shaik on 12/30/15.
//  Copyright (c) 2015 Sadat Shaik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetWorkouts.h"
#import "DisplayExerciseViewController.h"
#import "AppDelegate.h"
@interface ToDoController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
}
@property (weak, nonatomic) IBOutlet FUIButton *finishedButton;
- (IBAction)finishedWorkout:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *exerciseTableView;
@property(strong, nonatomic) Workout * todaysWorkouts;
@property(strong, nonatomic) NSNumber* typeOfDay;
@property(strong, nonatomic) Exercise * selectedExerciseToDisplay;
@end
