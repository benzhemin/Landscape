//
//  PresentViewController.h
//  Landscape
//
//  Created by ben on 13-6-22.
//  Copyright (c) 2013年 ben. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "LandscapeViewController.h"
#import "SignViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface PresentViewController : BaseViewController{
    LandscapeViewController *landscapeController;
}

@property(retain, nonatomic) LandscapeViewController *landscapeController;

-(void)pressLandscape;

@end
