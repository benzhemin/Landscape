//
//  CusNavigationController.m
//  Landscape
//
//  Created by ben on 13-6-22.
//  Copyright (c) 2013年 ben. All rights reserved.
//

#import "CusNavigationController.h"

@implementation CusNavigationController

// -------------------------------------------------------------------------------
//  supportedInterfaceOrientations:
//  Overridden to return the supportedInterfaceOrientations of the view controller
//  at the top of the navigation stack.
//  By default, UIViewController (and thus, UINavigationController) always returns
//  UIInterfaceOrientationMaskAllButUpsideDown when the app is run on an iPhone.
// -------------------------------------------------------------------------------
- (NSUInteger)supportedInterfaceOrientations{
    return [self.topViewController supportedInterfaceOrientations];
}

// -------------------------------------------------------------------------------
//  shouldAutorotate
//  Overridden to return the shouldAutorotate value of the view controller
//  at the top of the navigation stack.
//  By default, UIViewController (and thus, UINavigationController) always returns
//  YES when the app is run on an iPhone.
// -------------------------------------------------------------------------------
- (BOOL)shouldAutorotate{
    return [self.topViewController shouldAutorotate];
}

@end
