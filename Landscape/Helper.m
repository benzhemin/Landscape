//
//  Helper.m
//  Landscape
//
//  Created by ben on 13-6-23.
//  Copyright (c) 2013年 ben. All rights reserved.
//

#import "Helper.h"

@implementation Helper

/**
 计算屏幕宽度
 @returns 屏幕宽度
 */
+(float) screenWidth
{
    return [UIScreen mainScreen].bounds.size.width;
}

/**
 计算屏幕高度
 @returns 屏幕高度
 */
+(float) screenHeight
{
    return [UIScreen mainScreen].bounds.size.height;
}

@end
