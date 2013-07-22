//
//  SignViewController.m
//  Landscape
//
//  Created by ben on 13-7-21.
//  Copyright (c) 2013年 ben. All rights reserved.
//

#import "SignViewController.h"
#import "SignView.h"


@implementation SignViewController

@synthesize signView;

-(void)dealloc{
    [signView release];
    
    [super dealloc];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self setNavigationTitle:@"Sign"];
    
    CGRect frame = CGRectMake(0, 0, contentView.bounds.size.width, contentView.bounds.size.height);
    self.signView = [[[SignView alloc] initWithFrame:frame] autorelease];
    [contentView addSubview:signView];
    
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:NO];
    
    //self.view.bounds = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    NSTimeInterval animateTime = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
    
    CGAffineTransform newTransform = CGAffineTransformIdentity;
	CGRect bounds = [[UIScreen mainScreen] bounds];
	CGPoint center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
    bounds = CGRectMake(-20, 0, bounds.size.height, bounds.size.width);
    
    bgImageView.frame = bounds;
    naviBgView.frame = CGRectMake(0, 20, bounds.size.height, 44);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animateTime];
    self.view.transform = CGAffineTransformMakeRotation(M_PI_2);
    self.view.bounds = bounds;
    self.view.center = center;
    [UIView commitAnimations];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void) goBack:(id)sender{
    [super goBack:sender];
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:NO];
}

@end
