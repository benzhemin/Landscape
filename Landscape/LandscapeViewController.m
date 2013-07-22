//
//  LandscapeViewController.m
//  Landscape
//
//  Created by ben on 13-6-23.
//  Copyright (c) 2013年 ben. All rights reserved.
//

#import "LandscapeViewController.h"

@implementation LandscapeViewController

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    // Instruct the system to stop generating device orientation notifications.
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    
    [super dealloc];
}

-(id)init{
    if(self = [super init]){
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(orientationChanged:)
                                                     name:UIDeviceOrientationDidChangeNotification
                                                   object:nil];
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self setNavigationTitle:@"Landscape"];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSLog(@"width %.0f", self.view.bounds.size.width);
    self.bgImageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    self.naviBgView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 44);
    self.navTitleLabel.center = naviBgView.center;
    self.contentView.frame = CGRectMake(0, self.naviBgView.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height-50);
    
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[[UIImage imageNamed:@"nav-btn-bg.png"] stretchableImageWithLeftCapWidth:6 topCapHeight:15]forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(10, 7, 41, 31);
    [naviBgView addSubview:backBtn];
    [backBtn addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *backButtonLogo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"back-btn.png"]];
    backButtonLogo.frame = CGRectMake(9, 7, 22, 15);
    [backBtn addSubview:backButtonLogo];
    [backButtonLogo release];
    /*
    self.contentView.frame = CGRectMake(0, self.naviBgView.bounds.size.height, self.view.bounds.size.height, self.view.bounds.size.width-50);
    */
}

-(void)goBack:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}


- (void)orientationChanged:(NSNotification *)notification{
    // A delay must be added here, otherwise the new view will be swapped in
    // too quickly resulting in an animation glitch
    [self performSelector:@selector(updateLandscapeView) withObject:nil afterDelay:0];
}

-(void)updateLandscapeView{
    NSLog(@"should update landscape View");
}


- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscapeLeft|UIInterfaceOrientationMaskLandscapeRight;
}

// -------------------------------------------------------------------------------
//  shouldAutorotate
//  Overridden to return the shouldAutorotate value of the view controller
//  at the top of the navigation stack.
//  By default, UIViewController (and thus, UINavigationController) always returns
//  YES when the app is run on an iPhone.
// -------------------------------------------------------------------------------
- (BOOL)shouldAutorotate{
    return NO;
}

@end
