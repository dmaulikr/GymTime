//
//  ToDoController.m
//  GymTime
//
//  Created by Sadat Shaik on 12/30/15.
//  Copyright (c) 2015 Sadat Shaik. All rights reserved.
//

#import "ToDoController.h"

@interface ToDoController ()

@end

@implementation ToDoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.exerciseTableView.delegate = self;
    self.exerciseTableView.dataSource = self;
    NSLog(@"did load");
    self.todaysWorkouts = [[GetWorkouts getWorkoutsForWeek] objectAtIndex:[self.typeOfDay intValue]];
    [ViewController changeButtonStyle:self.finishedButton NewColor:[UIColor blueColor] ShadowColor:[UIColor blueColor]];
    for(Exercise *e in [self.todaysWorkouts exercises]){
        NSLog(@"%@",e.exerciseName);
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.todaysWorkouts exercises] count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    self.title = [[NSString alloc] initWithFormat:@"Today's Workout"];
    UITableViewCell * tableViewCell = [self.exerciseTableView dequeueReusableCellWithIdentifier:@"ExerciseCell"];
    Exercise * currentExercise = [[self.todaysWorkouts exercises] objectAtIndex:indexPath.row];
    [[tableViewCell textLabel] setText:[currentExercise exerciseName]];
    return tableViewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"clicked row");
    //Value Selected by user
    Exercise *selectedExercise = [[self.todaysWorkouts exercises] objectAtIndex:indexPath.row];
    self.selectedExerciseToDisplay = selectedExercise;
    [self performSegueWithIdentifier:@"displayExerciseInformation" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if(([[segue destinationViewController] isKindOfClass:[DisplayExerciseViewController class]])){
        ((DisplayExerciseViewController *)segue.destinationViewController).exerciseToDisplay = self.selectedExerciseToDisplay;
        self.selectedExerciseToDisplay = nil;
    }
}

- (IBAction)finishedWorkout:(id)sender {
    [self performSegueWithIdentifier:@"finishWorkoutSegue" sender:self];
}
@end
