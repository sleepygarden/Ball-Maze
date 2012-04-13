//
//  ballViewController.h
//  Ball Maze
//
//  Created by Michael Cornell on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ballViewController : UIViewController <UIAccelerometerDelegate>{
    UIImageView *ball;
    CGPoint delta;
}

@property (nonatomic,retain) IBOutlet UIImageView *ball;

@property CGPoint delta;
@property (weak, nonatomic) IBOutlet UIImageView *hole;
-(void)ballWall:(UIImageView*)currentBall;
-(void)ballCollide:(UIImageView*)currentBall;
@end
