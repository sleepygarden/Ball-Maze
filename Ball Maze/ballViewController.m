//
//  ballViewController.m
//  Ball Maze
//
//  Created by Michael Cornell on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ballViewController.h"

@implementation ballViewController
@synthesize ball;
@synthesize delta;
@synthesize hole;

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    
    
    delta.x=acceleration.x *6; //acceleration is only between -1 and 1, moving by one pixel is slow
    delta.y=acceleration.y *6;

    ball.center = CGPointMake(ball.center.x + delta.x, ball.center.y - delta.y);
   
    
    [self ballWall:ball];
    
    
    
    [self ballCollide:ball];
    

}

-(void)ballWall:(UIImageView*)currentBall{
    //Left Wall, goto Right
    if (currentBall.center.x <0) {
        currentBall.center = CGPointMake(320, ball.center.y);
    }
    
    //Right Wall, goto Left
    if (currentBall.center.x >320) {
        currentBall.center = CGPointMake(0, ball.center.y);
    }
    
    //Bottom Wall, goto Top
    if (currentBall.center.y <0) {
        currentBall.center = CGPointMake(ball.center.x,460);
    }
    
    //Top Wall, goto Bottom
    if (currentBall.center.y >460) {
        currentBall.center = CGPointMake(ball.center.x, 0);
    }
}


-(void)ballCollide:(UIImageView*)currentBall
{
    UIImageView *temp;
    temp.frame = CGRectMake(hole.center.x, hole.center.y, 56,56);
   if (CGRectIntersectsRect(currentBall.frame,temp.frame)) 
    {
       NSLog(@"Collision detected!"); 
    }
}

- (void)viewDidLoad
{
    UIAccelerometer *accel = [UIAccelerometer sharedAccelerometer];
    accel.delegate = self;
    accel.updateInterval = 1.0f/60.0f; //60 frames per second    
    [super viewDidLoad];
   

}



- (void)viewDidUnload {
    [self setHole:nil];
    [super viewDidUnload];
}
@end
