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
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    bounds = CGRectMake(0.f, 0.f, bounds.size.height, bounds.size.width);
    
    CGRect signFrame = CGRectMake(0, 0, bounds.size.width, 320-20-44);
    self.signView = [[[SignView alloc] initWithFrame:signFrame] autorelease];
    [contentView addSubview:signView];
    
    
    contentView.frame = CGRectMake(0, 44, bounds.size.width, bounds.size.height-44);
    //signView.center = contentView.center;
    
    CGAffineTransform transform = self.view.transform;
    
	
    
    bgImageView.frame = bounds;
    naviBgView.frame = CGRectMake(0, 20, bounds.size.width, 44);
    navTitleLabel.center = CGPointMake(naviBgView.center.x, navTitleLabel.center.y);
    backBtn.center = CGPointMake(backBtn.center.x+10, backBtn.center.y);
    
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    CGRect statusBounds = CGRectMake(0, 0, statusBarFrame.size.height, statusBarFrame.origin.x);
    CGPoint center = CGPointMake(statusBounds.size.height / 2.0, statusBounds.size.width / 2.0);
    // set the center point of the view to the center point of the window's content area.
    self.view.center = center;
    // Rotate the view 90 degrees around its new center point.
    transform = CGAffineTransformRotate(transform, (M_PI / 2.0));
    self.view.transform = transform;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //bgImageView.alpha = 0;
    
    
}

-(void)viewDidLayoutSubviews{
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    bounds = CGRectMake(0.f, 0.f, bounds.size.height, bounds.size.width);
    
    self.view.center = CGPointMake(self.view.center.x, self.view.center.y+10);
}

-(void) goBack:(id)sender{
    [super goBack:sender];
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:NO];
}

@end
