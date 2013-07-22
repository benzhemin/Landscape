//
//  PresentViewController.m
//  Landscape
//
//  Created by ben on 13-6-22.
//  Copyright (c) 2013年 ben. All rights reserved.
//

#import "PresentViewController.h"

@implementation PresentViewController

@synthesize landscapeController;

-(void)dealloc{
    [landscapeController release];
    
    [super dealloc];
}

-(void)viewDidLoad{
    [super viewDidLoad];

    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self setNavigationTitle:@"PresentView"];
    
    UIButton *landscapeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    landscapeBtn.frame = CGRectMake(0, 0, 100 , 35);
    [landscapeBtn setTitle:@"Landscape" forState:UIControlStateNormal];
    [self.view addSubview:landscapeBtn];
    landscapeBtn.center = CGPointMake(self.view.center.x, self.view.center.y-80);
    [landscapeBtn addTarget:self action:@selector(pressLandscape) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *signBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    signBtn.frame = CGRectMake(0, 0, 100 , 35);
    [signBtn setTitle:@"Sign Name" forState:UIControlStateNormal];
    [self.view addSubview:signBtn];
    signBtn.center = CGPointMake(self.view.center.x, self.view.center.y);
    [signBtn addTarget:self action:@selector(pressSignName) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *locBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    locBtn.frame = CGRectMake(0, 0, 100, 35);
    [locBtn setTitle:@"Locate" forState:UIControlStateNormal];
    [self.view addSubview:locBtn];
    locBtn.center = CGPointMake(self.view.center.x, self.view.center.y+80);
    [locBtn addTarget:self action:@selector(pressLocate) forControlEvents:UIControlEventTouchUpInside];

}

-(void)pressSignName{
    SignViewController *sc = [[SignViewController alloc] init];
    [self.navigationController pushViewController:sc animated:YES];
    [sc release];
}

-(void)pressLandscape{
    self.landscapeController = [[LandscapeViewController alloc] init];
    
    //[self.navigationController pushViewController:landscapeController animated:YES];
    
    if ([self respondsToSelector:@selector(presentViewController:animated:completion:)])
        [self presentViewController:landscapeController animated:NO completion:NULL];
    else
        [self presentModalViewController:landscapeController animated:YES];
    
}

-(void)pressLocate{
    //CLLocationManager *manager = [[CLLocationManager alloc] init];
    //if ([CLLocationManager locationServicesEnabled] == NO) {
        UIAlertView *servicesDisabledAlert = [[UIAlertView alloc] initWithTitle:@"Location Services Disabled" message:@"You currently have all location services for this device disabled. If you proceed, you will be asked to confirm whether location services should be reenabled." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [servicesDisabledAlert show];
        [servicesDisabledAlert release];
    //}
}

@end






















