//
//  SignView.h
//  Landscape
//
//  Created by ben on 13-7-21.
//  Copyright (c) 2013年 ben. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignView : UIView{
    NSMutableArray *pointsList;
}

@property (nonatomic, retain) NSMutableArray *pointsList;

-(void)clear;

-(void)drawSignFromArray:(NSArray *)points;

@end
