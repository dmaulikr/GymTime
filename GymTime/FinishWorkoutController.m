//
//  FinishWorkoutController.m
//  GymTime
//
//  Created by Sadat Shaik on 1/3/16.
//  Copyright (c) 2016 Sadat Shaik. All rights reserved.
//

#import "FinishWorkoutController.h"

@interface FinishWorkoutController ()

@end

@implementation FinishWorkoutController

- (void)viewDidLoad {
    [super viewDidLoad];
    difficulty = 1;
    enjoyment = 1;
    effectiveness = 1;
    [ViewController changeButtonStyle:self.submitButton NewColor:[UIColor blueColor] ShadowColor:[UIColor blueColor]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

- (IBAction)clickedStar:(id)sender {
    UIButton * currentButton = (UIButton *)sender;
    difficulty = currentButton.tag;
    for(int i = 1 ; i <= difficulty; i ++){
        UIButton * star = [self.difficultyStars objectAtIndex:i-1];
        [star setBackgroundImage:[UIImage imageNamed:@"glyphicons-50-star-gold.png"] forState:UIControlStateHighlighted];
        [star setBackgroundImage:[UIImage imageNamed:@"glyphicons-50-star-gold.png"] forState:UIControlStateNormal];
        
    }for(int i = difficulty +1; i <=5; i++){
        UIButton * star = [self.difficultyStars objectAtIndex:i-1];
        [star setBackgroundImage:[UIImage imageNamed:@"glyphicons-50-star.png"] forState:UIControlStateHighlighted];
        [star setBackgroundImage:[UIImage imageNamed:@"glyphicons-50-star.png"] forState:UIControlStateNormal];
    }
    NSLog(@"diffic: %i",difficulty);
}

- (IBAction)clickedEffectiveness:(id)sender {
    UIButton * currentButton = (UIButton *)sender;
    effectiveness = currentButton.tag;
    for(int i = 1 ; i <= effectiveness; i ++){
        UIButton * star = [self.effectivenessStars objectAtIndex:i-1];
        [star setBackgroundImage:[UIImage imageNamed:@"glyphicons-50-star-gold.png"] forState:UIControlStateHighlighted];
        [star setBackgroundImage:[UIImage imageNamed:@"glyphicons-50-star-gold.png"] forState:UIControlStateNormal];
        
    }for(int i = effectiveness +1; i <=5; i++){
        UIButton * star = [self.effectivenessStars objectAtIndex:i-1];
        [star setBackgroundImage:[UIImage imageNamed:@"glyphicons-50-star.png"] forState:UIControlStateHighlighted];
        [star setBackgroundImage:[UIImage imageNamed:@"glyphicons-50-star.png"] forState:UIControlStateNormal];
    }
    NSLog(@"effec: %i",effectiveness);
}

- (IBAction)clickedEnjoyment:(id)sender {
    UIButton * currentButton = (UIButton *)sender;
    enjoyment = currentButton.tag;
    for(int i = 1 ; i <= enjoyment; i ++){
        UIButton * star = [self.enjoymentStars objectAtIndex:i-1];
        [star setBackgroundImage:[UIImage imageNamed:@"glyphicons-50-star-gold.png"] forState:UIControlStateHighlighted];
        [star setBackgroundImage:[UIImage imageNamed:@"glyphicons-50-star-gold.png"] forState:UIControlStateNormal];
        
    }for(int i = enjoyment +1; i <=5; i++){
        UIButton * star = [self.enjoymentStars objectAtIndex:i-1];
        [star setBackgroundImage:[UIImage imageNamed:@"glyphicons-50-star.png"] forState:UIControlStateHighlighted];
        [star setBackgroundImage:[UIImage imageNamed:@"glyphicons-50-star.png"] forState:UIControlStateNormal];
    }
    NSLog(@"enjoy: %i",enjoyment);
}

- (IBAction)submitData:(id)sender {
}
@end
