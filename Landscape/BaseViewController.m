//
//  BaseViewController.m
//  Landscape
//
//  Created by ben on 13-6-22.
//  Copyright (c) 2013年 ben. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

@synthesize bgImageView, contentView;

@synthesize naviBgView, backBtn;
@synthesize navTitleLabel;

@synthesize isHiddenNaviBar;

-(void)dealloc{
    [bgImageView release];
    [contentView release];
    
    [naviBgView release];
    [backBtn release];
    
    [navTitleLabel release];
    
    [super dealloc];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    //backgroud image
    self.bgImageView = [[UIImageView alloc] init];
    bgImageView.userInteractionEnabled = YES;
    bgImageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    bgImageView.image = [UIImage imageNamed:@"bg.png"];
    [self.view addSubview:bgImageView];
    [bgImageView release];
    
    //content view
    self.contentView = [[UIView alloc] init];
    contentView.userInteractionEnabled = YES;
    contentView.backgroundColor = [UIColor clearColor];
    [bgImageView addSubview:contentView];
    [contentView release];
    
    
    if(!self.isHiddenNaviBar){
        self.naviBgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav-bg.png"]];
        
        naviBgView.frame = CGRectMake(0, 0, [Helper screenWidth], 44);
        naviBgView.userInteractionEnabled = YES;
        [bgImageView addSubview:naviBgView];
        [naviBgView release];
        
        if(self.navigationController.viewControllers.count > 1){
            self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [backBtn setBackgroundImage:[[UIImage imageNamed:@"nav-btn-bg.png"] stretchableImageWithLeftCapWidth:6 topCapHeight:15]forState:UIControlStateNormal];
            backBtn.frame = CGRectMake(10, 7, 41, 31);
            [naviBgView addSubview:backBtn];
            [backBtn addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
            
            UIImageView *backButtonLogo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"back-btn.png"]];
            backButtonLogo.frame = CGRectMake(9, 7, 22, 15);
            [backBtn addSubview:backButtonLogo];
            [backButtonLogo release];
        }
        
        //初始化显示导航条上的文字Label
        self.navTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake((naviBgView.frame.size.width-150)/2, 0, 150, naviBgView.frame.size.height-1)];
        //navTitleLabel.text =@"账户信息";
        navTitleLabel.textAlignment = NSTextAlignmentCenter;
        navTitleLabel.font = [UIFont boldSystemFontOfSize:20];
        navTitleLabel.textColor = [UIColor whiteColor];
        navTitleLabel.backgroundColor = [UIColor clearColor];
        [naviBgView addSubview:navTitleLabel];
        [navTitleLabel release];
        
        contentView.frame = CGRectMake(0,naviBgView.frame.size.height, self.view.frame.size.width,self.view.frame.size.height-naviBgView.frame.size.height);
    }else{
        contentView.frame = CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height);
    }
}

//处理Back按钮事件
-(void) goBack:(id)sender{
    //如果当前NavigationController中ViewController超过1个，移除最上面的一个
    if (self.navigationController.viewControllers.count>1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

//设置导航标题
-(void)setNavigationTitle:(NSString *)title{
    if (!self.isHiddenNaviBar) {
        //NSLog(title);
        navTitleLabel.text = title;
    }
}

// -------------------------------------------------------------------------------
//  supportedInterfaceOrientations:
//  Overridden to return the supportedInterfaceOrientations of the view controller
//  at the top of the navigation stack.
//  By default, UIViewController (and thus, UINavigationController) always returns
//  UIInterfaceOrientationMaskAllButUpsideDown when the app is run on an iPhone.
// -------------------------------------------------------------------------------

- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait|UIInterfaceOrientationMaskLandscapeLeft|UIInterfaceOrientationMaskLandscapeRight;
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




































