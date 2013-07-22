//
//  BaseViewController.h
//  Landscape
//
//  Created by ben on 13-6-22.
//  Copyright (c) 2013年 ben. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helper.h"

@interface BaseViewController : UIViewController{
    UIImageView *bgImageView;
    UIView *contentView;
    
    UIImageView *naviBgView;
    UIButton *backBtn;
    UILabel *navTitleLabel;
    
    Boolean isHiddenNaviBar;
}

@property(retain, nonatomic) UIImageView *bgImageView;
@property(retain, nonatomic) UIView *contentView;

@property(retain, nonatomic) UIImageView *naviBgView;
@property(retain, nonatomic) UIButton *backBtn;
@property(retain, nonatomic) UILabel *navTitleLabel;

@property(assign, nonatomic) Boolean isHiddenNaviBar;

-(void) goBack:(id)sender;
-(void)setNavigationTitle:(NSString *)title;

@end
