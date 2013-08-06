//
//  TestRotationViewController.m
//  Landscape
//
//  Created by chinapnr on 13-8-6.
//  Copyright (c) 2013年 ben. All rights reserved.
//

#import "TestRotationViewController.h"

@interface TestRotationViewController ()

@end

@implementation TestRotationViewController

@synthesize signView;

-(void)dealloc{
    [signView release];
    [super dealloc];
}

#define STATUS_BAR_HEIGHT 20

- (void)viewDidLoad
{
    self.wantsFullScreenLayout = YES;
    
    [super viewDidLoad];
    
    [self setNavigationTitle:@"Rotation"];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    
    self.signView = [[[SignView alloc] init] autorelease];
    [contentView addSubview:signView];
    
     
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    CGRect statusBounds = CGRectMake(0, 0, statusBarFrame.size.height, statusBarFrame.origin.x);
    
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    bounds = CGRectMake(0.f, 0.f, bounds.size.height, bounds.size.width);
    
    

    CGPoint center = CGPointMake(statusBounds.size.height / 2.0, statusBounds.size.width / 2.0);
    
    // set the center point of the view to the center point of the window's content area.
    self.view.center = center;
    // Rotate the view 90 degrees around its new center point.
    CGAffineTransform transform = self.view.transform;
    transform = CGAffineTransformRotate(transform, (M_PI / 2.0));
    self.view.transform = transform;
    
    self.contentView.backgroundColor = [UIColor darkGrayColor];
    
    self.bgImageView.frame = bounds;
    self.naviBgView.frame = CGRectMake(0, STATUS_BAR_HEIGHT, bounds.size.width, 44);
    self.navTitleLabel.center = CGPointMake(naviBgView.center.x, navTitleLabel.center.y);
    self.contentView.frame = CGRectMake(0, STATUS_BAR_HEIGHT+44, bounds.size.width, bounds.size.height-STATUS_BAR_HEIGHT-44);
    self.signView.frame = contentView.bounds;
    
    
}

-(void) goBack:(id)sender{
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:NO];
    [super goBack:sender];
}

@end
